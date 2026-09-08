--- egg/egg-unix-credentials.c.orig	2025-03-18 08:38:44 UTC
+++ egg/egg-unix-credentials.c
@@ -145 +145,3 @@ egg_unix_credentials_read (int sock, pid_t *pid, uid_t
-		set_local_creds(sock, 0);
+#ifndef __FreeBSD__
+		set_local_creds(sock, 0);
+#endif
@@ -233 +235 @@ egg_unix_credentials_setup (int sock)
-		fprintf (stderr, "unable to set LOCAL_CREDS socket option on fd %d\n", fd);
+		fprintf (stderr, "unable to set LOCAL_CREDS socket option\n");
