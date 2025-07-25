--- gio/tests/fake-desktop-portal.c.orig	2025-07-25 10:14:09.152540000 -0400
+++ gio/tests/fake-desktop-portal.c	2025-07-25 10:15:19.361324000 -0400
@@ -212,7 +212,7 @@
 _g_fd_query_path (int      fd,
                   GError **error)
 {
-#if defined(__FreeBSD__)
+#if !defined(__MidnightBSD__) && defined(__FreeBSD__)
   struct kinfo_file kf;
   kf.kf_structsize = sizeof (kf);
   if (fcntl (fd, F_KINFO, &kf) < 0)
