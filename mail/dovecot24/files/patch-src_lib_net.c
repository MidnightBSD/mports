--- src/lib/net.c.orig	2026-08-28 00:00:00 UTC
+++ src/lib/net.c
@@ -9,6 +9,9 @@
 #include <fcntl.h>
 #include <ctype.h>
 #include <sys/un.h>
+#ifdef __FreeBSD__
+#  include <sys/ucred.h>
+#endif
 #include <netinet/tcp.h>
 #if defined(HAVE_UCRED_H)
 #  include <ucred.h> /* for getpeerucred() */
@@ -832,6 +835,26 @@
 	cred_r->gid = ucred.unp_egid;
 	cred_r->pid = ucred.unp_pid;
 	return 0;
+#elif defined(LOCAL_PEERCRED) && defined(__FreeBSD__) && __FreeBSD__ >= 13
+	/* FreeBSD 13+ / MidnightBSD 4+ (getpeereid() exists too, but struct
+	   xucred also carries the peer pid, which anvil needs) */
+	struct xucred ucred;
+	socklen_t len = sizeof(ucred);
+
+	if (getsockopt(fd, 0, LOCAL_PEERCRED, &ucred, &len) < 0) {
+		i_error("getsockopt(LOCAL_PEERCRED) failed: %m");
+		return -1;
+	}
+
+	if (ucred.cr_version != XUCRED_VERSION) {
+		errno = EINVAL;
+		return -1;
+	}
+
+	cred_r->uid = ucred.cr_uid;
+	cred_r->gid = ucred.cr_gid;
+	cred_r->pid = ucred.cr_pid;
+	return 0;
 #elif defined(HAVE_GETPEEREID)
 	/* OSX 10.4+, FreeBSD 4.6+, OpenBSD 3.0+, NetBSD 5.0+ */
 	if (getpeereid(fd, &cred_r->uid, &cred_r->gid) < 0) {
