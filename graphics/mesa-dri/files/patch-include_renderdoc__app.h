--- include/renderdoc_app.h.orig	2024-11-27 00:00:00 UTC
+++ include/renderdoc_app.h
@@ -35,7 +35,7 @@
 
 #if defined(WIN32)
 #define RENDERDOC_CC __cdecl
-#elif defined(__linux__)
+#elif defined(__linux__) || defined(__FreeBSD__) || defined(__MidnightBSD__)
 #define RENDERDOC_CC
 #elif defined(__APPLE__)
 #define RENDERDOC_CC
