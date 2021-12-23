--- glib/gspawn.c.orig	2021-12-03 05:02:55.854885000 -0500
+++ glib/gspawn.c	2021-12-22 21:37:08.218383000 -0500
@@ -51,6 +51,12 @@
 #include <sys/syscall.h>  /* for syscall and SYS_getdents64 */
 #endif
 
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+#include <sys/types.h>
+#include <sys/user.h>
+#include <libutil.h>
+#endif
+
 #include "gspawn.h"
 #include "gspawn-private.h"
 #include "gthread.h"
@@ -1399,6 +1405,33 @@
 }
 #endif
 
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+static int
+fdwalk2(int (*func)(void *, int), void *udata, gint *ret)
+{
+  struct kinfo_file *kf;
+  int i, cnt;
+
+  if (NULL == func)
+    return EINVAL;
+
+  kf = kinfo_getfile(getpid(), &cnt);
+  if (kf == NULL)
+    return ENOMEM;
+
+  for (i = 0; i < cnt; i++) {
+    if (0 > kf[i].kf_fd)
+      continue;
+    *ret = func (udata, kf[i].kf_fd);
+    if (*ret != 0)
+      break;
+  }
+
+  free(kf);
+  return 0;
+}
+#endif
+
 /* This function is called between fork() and exec() and hence must be
  * async-signal-safe (see signal-safety(7)). */
 static int
@@ -1425,6 +1458,12 @@
   struct rlimit rl;
 #endif
 
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+  if (fdwalk2(cb, data, &res) == 0)
+      return res;
+  /* If any sysctl/malloc call fails continue with the fall back method */
+#endif
+
 #ifdef __linux__
   /* Avoid use of opendir/closedir since these are not async-signal-safe. */
   int dir_fd = open ("/proc/self/fd", O_RDONLY | O_DIRECTORY);
@@ -1489,7 +1528,7 @@
   if (getrlimit (RLIMIT_NOFILE, &rl) == 0 && rl.rlim_max != RLIM_INFINITY)
     open_max = rl.rlim_max;
 #endif
-#if defined(__FreeBSD__) || defined(__OpenBSD__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__OpenBSD__) || defined(__APPLE__) || defined(__MidnightBSD__)
   /* Use sysconf() function provided by the system if it is known to be
    * async-signal safe.
    *
@@ -1545,7 +1584,7 @@
 static void
 safe_closefrom (int lowfd)
 {
-#if defined(__FreeBSD__) || defined(__OpenBSD__) || \
+#if defined(__FreeBSD__) || defined(__OpenBSD__) || defined(__MidnightBSD__) || \
   (defined(__sun__) && defined(F_CLOSEFROM))
   /* Use closefrom function provided by the system if it is known to be
    * async-signal safe.
