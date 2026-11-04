--- tools/tools.h.orig	2024-06-07 16:24:23.812428000 -0400
+++ tools/tools.h	2024-06-07 16:24:54.638298000 -0400
@@ -555,6 +555,7 @@
         { "winnt",       PLATFORM_MINGW },
         { "windows",     PLATFORM_WINDOWS },
         { "cygwin",      PLATFORM_CYGWIN },
+        { "midnightbsd",     PLATFORM_FREEBSD },
     };
     unsigned int i;
 
