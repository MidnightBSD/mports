--- panels/system/about/cc-system-details-window.c.orig	2026-09-11 00:00:00 UTC
+++ panels/system/about/cc-system-details-window.c
@@ -29,6 +29,10 @@
 #include <gio/gunixmounts.h>
 #include <gio/gdesktopappinfo.h>
 
+#ifdef __FreeBSD__
+#include <unistd.h>
+#endif
+
 #include <glibtop/fsusage.h>
 #include <glibtop/mountlist.h>
 #include <glibtop/mem.h>
@@ -327,16 +331,23 @@ get_os_name (void)
 {
   g_autofree gchar *name = NULL;
+#ifdef __linux__
   g_autofree gchar *version_id = NULL;
   g_autofree gchar *pretty_name = NULL;
+#endif
 
   name = g_get_os_info (G_OS_INFO_KEY_NAME);
+#ifdef __linux__
   version_id = g_get_os_info (G_OS_INFO_KEY_VERSION_ID);
   pretty_name = g_get_os_info (G_OS_INFO_KEY_PRETTY_NAME);
 
   if (pretty_name)
     return g_steal_pointer (&pretty_name);
   else if (name && version_id)
     return g_strdup_printf ("%s %s", name, version_id);
+#else
+  if (name)
+    return g_steal_pointer (&name);
+#endif
   else
     return g_strdup (_("Unknown"));
 }
@@ -346,8 +361,15 @@ static char *
 get_os_image_version (void)
 {
   char *image_version = NULL;
+#ifdef __FreeBSD__
+  gint kernel_version;
 
+  kernel_version = getosreldate ();
+  if (kernel_version > 0)
+    image_version = g_strdup_printf ("%i", kernel_version);
+#else
   image_version = g_get_os_info ("IMAGE_VERSION");
+#endif
 
   return image_version;
 }
@@ -471,6 +493,7 @@ static char *
 get_kernel_version_string ()
 {
   g_autofree char *kernel_name = NULL;
+#ifdef __linux__
   g_autofree char *kernel_release = NULL;
 
   kernel_name = cc_hostname_get_property (cc_hostname_get_default (), "KernelName");
@@ -479,4 +480,13 @@ get_kernel_version_string ()
     return NULL;
 
   return g_strdup_printf ("%s %s", kernel_name, kernel_release);
+#endif
+
+#ifdef __FreeBSD__
+  kernel_name = g_get_os_info (G_OS_INFO_KEY_VERSION);
+  if (kernel_name)
+    return g_steal_pointer (&kernel_name);
+#endif
+
+  return NULL;
 }
