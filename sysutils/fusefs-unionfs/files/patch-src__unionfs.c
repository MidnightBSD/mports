--- src/unionfs.c.orig	2016-11-21 19:57:34.000000000 -0500
+++ src/unionfs.c	2020-05-05 23:52:15.382435000 -0400
@@ -67,6 +67,13 @@
 #endif
 #endif
 
+// Patch pushed upstream: 
+// https://github.com/rpodgorny/unionfs-fuse/pull/40
+// Remove this as soon as pushed into a release.
+#ifdef IOCPARM_LEN
+#define _IOC_SIZE(nr) IOCPARM_LEN(nr)
+#endif
+
 static struct fuse_opt unionfs_opts[] = {
 	FUSE_OPT_KEY("chroot=%s,", KEY_CHROOT),
 	FUSE_OPT_KEY("cow", KEY_COW),
@@ -94,7 +101,12 @@
 	char p[PATHLEN_MAX];
 	if (BUILD_PATH(p, uopt.branches[i].path, path)) RETURN(-ENAMETOOLONG);
 
+// Unsure of origin. Patch needs review.
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+	int res = lchmod(p, mode);
+#else
 	int res = chmod(p, mode);
+#endif
 	if (res == -1) RETURN(-errno);
 
 	RETURN(0);
@@ -677,6 +689,9 @@
 	RETURN(0);
 }
 
+// Patch pushed upstream: 
+// https://github.com/rpodgorny/unionfs-fuse/pull/39
+// Remove this as soon as pushed into a release.
 static int unionfs_utimens(const char *path, const struct timespec ts[2]) {
 	DBG("%s\n", path);
 
