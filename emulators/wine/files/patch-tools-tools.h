--- tools/tools.h.orig
+++ tools/tools.h
@@ -672,6 +672,7 @@
         { "winnt",       PLATFORM_MINGW },
         { "windows",     PLATFORM_WINDOWS },
         { "cygwin",      PLATFORM_CYGWIN },
+        { "midnightbsd", PLATFORM_FREEBSD },
     };
     unsigned int i;
 
