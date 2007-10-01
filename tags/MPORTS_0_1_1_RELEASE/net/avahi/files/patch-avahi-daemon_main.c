--- avahi-daemon/main.c.orig	Wed May  9 09:09:19 2007
+++ avahi-daemon/main.c	Sat Jun  9 13:56:02 2007
@@ -50,6 +50,12 @@
 #endif
 #endif
 
+#ifdef HAVE_KQUEUE
+#include <sys/types.h>
+#include <sys/event.h>
+#include <unistd.h>
+#endif
+
 #include <libdaemon/dfork.h>
 #include <libdaemon/dsignal.h>
 #include <libdaemon/dlog.h>
@@ -691,6 +697,53 @@ static void add_inotify_watches(void) {
 
 #endif
 
+#ifdef HAVE_KQUEUE
+
+#define NUM_WATCHES 2
+
+static int kq = -1;
+static int kfds[NUM_WATCHES];
+static int num_kfds = 0;
+
+static void add_kqueue_watch(const char *dir);
+
+static void add_kqueue_watches(void) {
+	int c = 0;
+
+#ifdef ENABLE_CHROOT
+	c = config.use_chroot;
+#endif
+
+	add_kqueue_watch(c ? "/" : AVAHI_CONFIG_DIR);
+	add_kqueue_watch(c ? "/services" : AVAHI_SERVICE_DIR);
+}
+
+static void add_kqueue_watch(const char *dir) {
+	int fd;
+	struct kevent ev;
+
+	if (kq < 0)
+		return;
+
+	if (num_kfds >= NUM_WATCHES)
+		return;
+
+	fd = open(dir, O_RDONLY);
+	if (fd < 0)
+		return;
+	EV_SET(&ev, fd, EVFILT_VNODE, EV_ADD | EV_ENABLE | EV_CLEAR,
+			NOTE_DELETE | NOTE_EXTEND | NOTE_WRITE | NOTE_RENAME,
+			0, 0);
+	if (kevent(kq, &ev, 1, NULL, 0, NULL) == -1) {
+		close(fd);
+		return;
+	}
+
+	kfds[num_kfds++] = fd;
+}
+
+#endif
+
 static void reload_config(void) {
 
 #ifdef HAVE_INOTIFY
@@ -698,6 +751,10 @@ static void reload_config(void) {
     add_inotify_watches();
 #endif
 
+#ifdef HAVE_KQUEUE
+    add_kqueue_watches();
+#endif
+
 #ifdef ENABLE_CHROOT
     static_service_load(config.use_chroot);
     static_hosts_load(config.use_chroot);
@@ -746,6 +803,31 @@ static void inotify_callback(AvahiWatch 
 
 #endif
 
+#ifdef HAVE_KQUEUE
+
+static void kqueue_callback(AvahiWatch *watch, int fd, AVAHI_GCC_UNUSED AvahiWatchEvent event, AVAHI_GCC_UNUSED void *userdata) {
+	struct kevent ev;
+	struct timespec nullts = { 0, 0 };
+	int res;
+
+	assert(fd == kq);
+	assert(watch);
+
+	res = kevent(kq, NULL, 0, &ev, 1, &nullts);
+
+	if (res > 0) {
+		/* Sleep for a half-second to avoid potential races
+		 * during install/uninstall. */
+		usleep(500000);
+		avahi_log_info("Files changed, reloading.");
+		reload_config();
+	} else {
+		avahi_log_error("Failed to read kqueue event: %s", avahi_strerror(errno));
+	}
+}
+
+#endif
+
 static void signal_callback(AvahiWatch *watch, AVAHI_GCC_UNUSED int fd, AVAHI_GCC_UNUSED AvahiWatchEvent event, AVAHI_GCC_UNUSED void *userdata) {
     int sig;
     const AvahiPoll *poll_api;
@@ -801,6 +883,10 @@ static int run_server(DaemonConfig *c) {
 #ifdef HAVE_INOTIFY
     AvahiWatch *inotify_watch = NULL;
 #endif
+#ifdef HAVE_KQUEUE
+    int i;
+    AvahiWatch *kqueue_watch = NULL;
+#endif
 
     assert(c);
 
@@ -876,6 +962,19 @@ static int run_server(DaemonConfig *c) {
     }
 #endif
 
+#ifdef HAVE_KQUEUE
+    if ((kq = kqueue()) < 0)
+	    avahi_log_warn( "Failed to initialize kqueue: %s", strerror(errno));
+    else {
+	    add_kqueue_watches();
+
+	    if (!(kqueue_watch = poll_api->watch_new(poll_api, kq, AVAHI_WATCH_IN, kqueue_callback, NULL))) {
+		    avahi_log_error( "Failed to create kqueue watcher");
+		    goto finish;
+	    }
+    }
+#endif
+
     load_resolv_conf();
 #ifdef ENABLE_CHROOT
     static_service_load(config.use_chroot);
@@ -944,6 +1043,17 @@ finish:
         poll_api->watch_free(inotify_watch);
     if (inotify_fd >= 0)
         close(inotify_fd);
+#endif
+
+#ifdef HAVE_KQUEUE
+    if (kqueue_watch)
+	poll_api->watch_free(kqueue_watch);
+    if (kq >= 0)
+	close(kq);
+    for (i = 0; i < num_kfds; i++) {
+	if (kfds[i] >= 0)
+	    close(kfds[i]);
+    }
 #endif
     
     if (simple_poll_api) {
