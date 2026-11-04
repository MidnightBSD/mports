--- document-portal/document-portal.c.orig
+++ document-portal/document-portal.c
@@ -23,6 +23,10 @@
  */
 
 #include "config.h"
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+#include <sys/param.h>
+#include <sys/mount.h>
+#endif
 
 #include <locale.h>
 #include <stdlib.h>
@@ -1573,6 +1577,34 @@
       return;
     }
 
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+  /* mount_fusefs may return before the mount is visible. Do not record the
+   * underlying filesystem as the document portal's device. */
+  struct statfs *mounted;
+  unsigned int attempt;
+  for (attempt = 0; attempt < 500; attempt++)
+    {
+      int count = getmntinfo (&mounted, MNT_NOWAIT);
+      gboolean ready = FALSE;
+      for (int i = 0; i < count; i++)
+        if (strcmp (mounted[i].f_mntonname, xdp_fuse_get_mountpoint ()) == 0 &&
+            (strcmp (mounted[i].f_fstypename, "fusefs") == 0 ||
+             g_str_has_prefix (mounted[i].f_fstypename, "fusefs.")))
+          ready = TRUE;
+      if (ready)
+        break;
+      g_usleep (10000);
+    }
+  if (attempt == 500)
+    {
+      g_set_error_literal (&exit_error, G_DBUS_ERROR, G_DBUS_ERROR_FAILED,
+                           "Timed out waiting for document FUSE mount");
+      final_exit_status = 7;
+      g_main_loop_quit (loop);
+      return;
+    }
+#endif
+
   if (stat (xdp_fuse_get_mountpoint (), &stbuf) != 0)
     {
       g_set_error (&exit_error, G_DBUS_ERROR, G_DBUS_ERROR_FAILED, "fuse stat failed: %s", g_strerror (errno));
