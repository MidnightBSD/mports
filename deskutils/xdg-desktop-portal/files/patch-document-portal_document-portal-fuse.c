--- document-portal/document-portal-fuse.c.orig
+++ document-portal/document-portal-fuse.c
@@ -317,7 +317,13 @@
 static char *
 fd_to_path (int fd)
 {
-  return g_strdup_printf ("/proc/self/fd/%d", fd);
+  return g_strdup_printf (
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+                         "/dev/fd/%d",
+#else
+                         "/proc/self/fd/%d",
+#endif
+                         fd);
 }
 
 static char *
@@ -3036,6 +3042,19 @@
 
   g_debug ("STATFS %" G_GINT64_MODIFIER "x", ino);
 
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+  /* The kernel queries the virtual root with its own credentials while
+   * mounting. It has no backing document and exposes no storage statistics. */
+  if (ino == FUSE_ROOT_ID)
+    {
+      memset (&buf, 0, sizeof (buf));
+      buf.f_bsize = buf.f_frsize = 4096;
+      buf.f_namemax = 255;
+      fuse_reply_statfs (req, &buf);
+      return;
+    }
+#endif
+
   if (!xdp_document_inode_checks (op, req, inode, 0))
     return;
 
@@ -3402,7 +3421,8 @@
   g_debug ("INIT");
 
   /* atomic_o_trunc: We handle O_TRUNC in create() */
-  conn->want |= FUSE_CAP_ATOMIC_O_TRUNC;
+  if (conn->capable & FUSE_CAP_ATOMIC_O_TRUNC)
+    conn->want |= FUSE_CAP_ATOMIC_O_TRUNC;
 
   if (fuse_opts->use_splice)
     {
@@ -3506,7 +3526,11 @@
    *  auto_unmount: Tell fusermount to auto unmount if we die.
    */
   static char *fusermount_argv[] = {
-    "xdp-fuse", "-osubtype=portal,fsname=portal,auto_unmount",
+    "xdp-fuse", "-osubtype=portal,fsname=portal"
+#ifdef __linux__
+    ",auto_unmount"
+#endif
+    ,
   };
   g_auto(XdpAutoFuseArgs) args =
     FUSE_ARGS_INIT (G_N_ELEMENTS (fusermount_argv), fusermount_argv);
