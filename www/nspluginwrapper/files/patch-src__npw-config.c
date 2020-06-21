--- src/npw-config.c.orig	2011-06-30 23:18:57 -0400
+++ src/npw-config.c	2011-08-30 22:51:16 -0400
@@ -130,11 +130,12 @@
   if (dir == NULL) {
 	const char **dirs = NULL;
 
-#if defined(__FreeBSD__)
+#if defined(__MidnightBSD__)
 	{
 	  static const char *freebsd_dirs[] = {
-		"/usr/X11R6/" LIB "/browser_plugins",
-		"/usr/X11R6/" LIB "/firefox/plugins",
+		"/usr/local/" LIB "/browser_plugins",
+		"/usr/local/" LIB "/firefox/plugins",
+		"/usr/local/" LIB "/seamonkey/plugins",
 	  };
 	  dirs = freebsd_dirs;
 	}
@@ -231,12 +232,14 @@
 	"/usr/lib/nsbrowser/plugins",
 	"/usr/lib32/nsbrowser/plugins",				// XXX how unfortunate
 	"/usr/lib64/nsbrowser/plugins",
-#if defined(__FreeBSD__)
-	"/usr/X11R6/lib/browser_plugins",
-	"/usr/X11R6/lib/firefox/plugins",
-	"/usr/X11R6/lib/linux-mozilla/plugins",
+#if defined(__MidnightBSD__)
+	"/usr/local/lib/browser_plugins",
+	"/usr/local/lib/firefox/plugins",
+	"/usr/local/lib/seamonkey/plugins",
 	"/usr/local/lib/npapi/linux-flashplugin",
-	"/usr/X11R6/Adobe/Acrobat7.0/ENU/Browser/intellinux",
+	"/usr/local/lib/npapi/linux-f10-flashplugin",
+	"/usr/local/Adobe/Acrobat7.0/ENU/Browser/intellinux",
+	"/usr/local/Adobe/Reader8/ENU/Adobe/Reader8/Browser/intellinux",
 #endif
 #if defined(__DragonFly__)
 	"/usr/pkg/lib/netscape/plugins",
