--- ./src/npw-config.c.orig	Thu Jun 26 16:50:28 2008
+++ ./src/npw-config.c	Sun Oct  5 23:16:57 2008
@@ -119,11 +119,19 @@
 #if defined(__FreeBSD__)
 	{
 	  static const char *freebsd_dirs[] = {
-		"/usr/X11R6/" LIB "/browser_plugins",
-		"/usr/X11R6/" LIB "/firefox/plugins",
+		"/usr/local/" LIB "/browser_plugins",
+		"/usr/local/" LIB "/firefox/plugins",
 	  };
 	  dirs = freebsd_dirs;
 	}
+#elif defined(__MidnightBSD__)
+        {
+          static const char *freebsd_dirs[] = {
+                "/usr/local/" LIB "/browser_plugins",
+                "/usr/local/" LIB "/firefox/plugins",
+          };
+          dirs = freebsd_dirs;
+        }
 #elif defined(__DragonFly__)
 	{
 	  static const char *dragonfly_dirs[] = {
@@ -208,11 +216,20 @@
 	"/usr/lib32/nsbrowser/plugins",				// XXX how unfortunate
 	"/usr/lib64/nsbrowser/plugins",
 #if defined(__FreeBSD__)
-	"/usr/X11R6/lib/browser_plugins",
-	"/usr/X11R6/lib/firefox/plugins",
-	"/usr/X11R6/lib/linux-mozilla/plugins",
+	"/usr/local/lib/browser_plugins",
+	"/usr/local/lib/firefox/plugins",
+	"/usr/local/lib/browser/plugins",
+	"/usr/local/lib/linux-mozilla/plugins",
 	"/usr/local/lib/npapi/linux-flashplugin",
-	"/usr/X11R6/Adobe/Acrobat7.0/ENU/Browser/intellinux",
+	"/usr/local/Adobe/Acrobat7.0/ENU/Browser/intellinux",
+#endif
+#if defined(__MidnightBSD__)
+        "/usr/local/lib/browser_plugins",
+	"/usr/local/lib/browser/plugins",
+        "/usr/local/lib/firefox/plugins",
+        "/usr/local/lib/linux-mozilla/plugins",
+        "/usr/local/lib/npapi/linux-flashplugin",
+        "/usr/local/Adobe/Acrobat7.0/ENU/Browser/intellinux",
 #endif
 #if defined(__DragonFly__)
 	"/usr/pkg/lib/netscape/plugins",
