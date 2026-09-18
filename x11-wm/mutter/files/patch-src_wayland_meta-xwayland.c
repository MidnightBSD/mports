--- src/wayland/meta-xwayland.c.orig
+++ src/wayland/meta-xwayland.c
@@ -602,16 +602,22 @@
 {
   g_autofd int abstract_fd = -1, unix_fd = -1;
 
+#ifdef __linux__
   if (abstract_fd_out)
     {
       abstract_fd = bind_to_abstract_socket (display_index, error);
       if (abstract_fd < 0)
         return FALSE;
     }
+#endif
 
   unix_fd = bind_to_unix_socket (display_index, error);
   if (unix_fd < 0)
     return FALSE;
+
+#ifndef __linux__
+  abstract_fd = g_steal_fd (&unix_fd);
+#endif
 
   if (abstract_fd_out)
     *abstract_fd_out = g_steal_fd (&abstract_fd);
