--- lib/ephy-sync-utils.c.orig	2026-09-17 00:00:00 UTC
+++ lib/ephy-sync-utils.c
@@ -35,7 +35,7 @@
 #include <json-glib/json-glib.h>
 #include <webkit/webkit.h>
-#if defined(__linux__)
+#if defined(__linux__) || defined(__FreeBSD__)
 #include <sys/random.h>
 #elif defined(__FreeBSD__) || defined(__OpenBSD__)
 #include <unistd.h>
