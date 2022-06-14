--- lib/Support/Unix/Program.inc.orig	2022-05-05 06:33:56.711260000 -0400
+++ lib/Support/Unix/Program.inc	2022-05-05 06:34:32.755067000 -0400
@@ -54,7 +54,7 @@
 #endif
 
 #if !USE_NSGETENVIRON
-  extern char **environ;
+  char **environ;
 #else
 #include <crt_externs.h> // _NSGetEnviron
 #endif
