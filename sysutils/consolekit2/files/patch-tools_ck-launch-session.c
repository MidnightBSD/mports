--- tools/ck-launch-session.c.orig	2026-04-17 08:41:44 UTC
+++ tools/ck-launch-session.c
@@ -34,6 +34,10 @@
  */
 
 #include <sys/types.h>
+#ifdef __FreeBSD__
+#include <sys/procctl.h>
+#endif
+#include <sys/stat.h>
 #include <sys/wait.h>
 #ifdef HAVE_PATHS_H
 #include <paths.h>
@@ -41,7 +45,10 @@
 #define _PATH_BSHELL "/bin/sh"
 #endif
 
+#include <errno.h>
+#include <signal.h>
 #include <stdlib.h>
+#include <string.h>
 #include <syslog.h>
 #include <unistd.h>
 #include <libintl.h>
@@ -68,6 +75,136 @@ check_shell (const gchar *shell)
         return TRUE;
 }
 
+/*
+ * An inherited XDG_RUNTIME_DIR (e.g. set by pam_xdg at login) is kept only
+ * if it is what the XDG Base Directory spec requires: an absolute path to a
+ * directory (not a symlink to one) owned by the user with mode 0700.
+ */
+static gboolean
+runtime_dir_is_valid (const char *dir)
+{
+        struct stat st;
+
+        if (dir == NULL || dir[0] != '/') {
+                return FALSE;
+        }
+
+        if (lstat (dir, &st) != 0) {
+                return FALSE;
+        }
+
+        return S_ISDIR (st.st_mode) &&
+               st.st_uid == getuid () &&
+               (st.st_mode & 07777) == 0700;
+}
+
+/*
+ * Wait for the session command and return the status to exit with: its
+ * exit code, or 128 + the signal number if a signal killed it (the shell
+ * convention).  Any other child that exits meanwhile (e.g. an orphan
+ * reparented to us as reaper) is reaped so it does not linger as a zombie.
+ */
+static int
+wait_for_command (pid_t pid)
+{
+        pid_t wpid;
+        int   status;
+
+        for (;;) {
+                wpid = waitpid (-1, &status, 0);
+                if (wpid == pid) {
+                        break;
+                }
+                if (wpid == -1 && errno != EINTR) {
+                        syslog (LOG_ERR, "error waiting for child: %m");
+                        return 1;
+                }
+        }
+
+        if (WIFEXITED (status)) {
+                return WEXITSTATUS (status);
+        }
+        if (WIFSIGNALED (status)) {
+                return 128 + WTERMSIG (status);
+        }
+        return 1;
+}
+
+#ifdef __FreeBSD__
+#define REAP_GRACE_USEC (3 * G_USEC_PER_SEC)
+#define REAP_POLL_USEC  (100 * 1000)
+
+/* Reap exited descendants; return TRUE once none are left. */
+static gboolean
+reap_descendants (void)
+{
+        struct procctl_reaper_status rs;
+
+        while (waitpid (-1, NULL, WNOHANG) > 0)
+                ;
+
+        memset (&rs, 0, sizeof (rs));
+        if (procctl (P_PID, getpid (), PROC_REAP_STATUS, &rs) == -1) {
+                syslog (LOG_ERR, "error getting session process status: %m");
+                return TRUE;
+        }
+
+        return rs.rs_descendants == 0;
+}
+
+static gboolean
+wait_for_descendants (void)
+{
+        gulong waited;
+
+        for (waited = 0; waited < REAP_GRACE_USEC; waited += REAP_POLL_USEC) {
+                if (reap_descendants ()) {
+                        return TRUE;
+                }
+                g_usleep (REAP_POLL_USEC);
+        }
+
+        return reap_descendants ();
+}
+
+static void
+signal_descendants (int sig)
+{
+        struct procctl_reaper_kill rk;
+
+        memset (&rk, 0, sizeof (rk));
+        rk.rk_sig = sig;
+        if (procctl (P_PID, getpid (), PROC_REAP_KILL, &rk) == -1 &&
+            errno != ESRCH) {
+                syslog (LOG_WARNING, "error signalling session processes: %m");
+        }
+}
+
+/*
+ * Processes started in the session can outlive the session command, e.g. the
+ * dbus-daemon of dbus-run-session and the services it activated.  When we
+ * exit, ConsoleKit closes the session and may remove XDG_RUNTIME_DIR, so stop
+ * them first: SIGTERM, a grace period, then SIGKILL.
+ */
+static void
+stop_session_processes (void)
+{
+        if (reap_descendants ()) {
+                return;
+        }
+
+        signal_descendants (SIGTERM);
+        if (wait_for_descendants ()) {
+                return;
+        }
+
+        signal_descendants (SIGKILL);
+        if (!wait_for_descendants ()) {
+                syslog (LOG_WARNING, "session processes still running after SIGKILL");
+        }
+}
+#endif
+
 int
 main (int argc, char **argv)
 {
@@ -118,22 +255,57 @@ main (int argc, char **argv)
 
                 if (ret) {
                         const char *runtime_dir = NULL;
+#ifdef __FreeBSD__
+                        const char *keep;
+                        gboolean    reaper;
+
+                        /*
+                         * Become the reaper of the session's processes, so
+                         * the ones left after the command exits can be
+                         * stopped before the session is closed.
+                         *
+                         * MIDNIGHT_KEEP_SESSION_PROCESSES=1 opts out: they
+                         * keep running, but ConsoleKit may remove their
+                         * XDG_RUNTIME_DIR when the session closes.  The
+                         * variable is left set for the session's programs.
+                         */
+                        keep = getenv ("MIDNIGHT_KEEP_SESSION_PROCESSES");
+                        reaper = keep == NULL || strcmp (keep, "1") != 0;
+                        if (reaper &&
+                            procctl (P_PID, getpid (), PROC_REAP_ACQUIRE, NULL) == -1) {
+                                syslog (LOG_WARNING, "error becoming session process reaper: %m");
+                                reaper = FALSE;
+                        }
+#endif
                         pid = fork ();
                         switch (pid) {
                         case -1:
                                 syslog (LOG_ERR, "error forking child");
+#ifdef __FreeBSD__
+                                /* The command is exec'd in this process below. */
+                                if (reaper) {
+                                        procctl (P_PID, getpid (), PROC_REAP_RELEASE, NULL);
+                                }
+#endif
                                 break;
                         case 0:
                                 setenv ("XDG_SESSION_COOKIE",
                                        ck_connector_get_cookie (ckc), 1);
 
-                                runtime_dir = ck_connector_get_runtime_dir (ckc, &error);
-                                if (runtime_dir != NULL) {
-                                        setenv ("XDG_RUNTIME_DIR", runtime_dir, 1);
+                                if (!runtime_dir_is_valid (getenv ("XDG_RUNTIME_DIR"))) {
+                                        runtime_dir = ck_connector_get_runtime_dir (ckc, &error);
+                                        if (runtime_dir != NULL) {
+                                                setenv ("XDG_RUNTIME_DIR", runtime_dir, 1);
+                                        }
                                 }
                                 break;
                         default:
-                                waitpid (pid, &status, 0);
+                                status = wait_for_command (pid);
+#ifdef __FreeBSD__
+                                if (reaper) {
+                                        stop_session_processes ();
+                                }
+#endif
                                 exit (status);
                                 break;
                         }
