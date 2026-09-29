Based on https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=258042

--- src/wayland/meta-xwayland.c.orig
+++ src/wayland/meta-xwayland.c
@@ -595,18 +595,32 @@
                       int                  *unix_fd_out,
                       GError              **error)
 {
-  int abstract_fd, unix_fd;
+  int abstract_fd = -1, unix_fd;
 
+#ifdef __linux__
   abstract_fd = bind_to_abstract_socket (display_index, error);
   if (abstract_fd < 0)
     return FALSE;
+#endif
 
   unix_fd = bind_to_unix_socket (display_index, error);
   if (unix_fd < 0)
     {
-      close (abstract_fd);
+      if (abstract_fd >= 0)
+        close (abstract_fd);
+      return FALSE;
+    }
+
+#ifndef __linux__
+  abstract_fd = dup (unix_fd);
+  if (abstract_fd < 0)
+    {
+      g_set_error (error, G_IO_ERROR, g_io_error_from_errno (errno),
+                   "Failed to duplicate X11 socket: %s", g_strerror (errno));
+      close (unix_fd);
       return FALSE;
     }
+#endif
 
   *abstract_fd_out = abstract_fd;
   *unix_fd_out = unix_fd;
