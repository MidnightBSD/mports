--- lib/Support/Unix/Program.inc.orig	2022-06-02 10:56:01.602949000 -0400
+++ lib/Support/Unix/Program.inc	2022-06-02 10:57:22.183161000 -0400
@@ -53,7 +53,7 @@
 #endif
 
 #if !USE_NSGETENVIRON
-  extern char **environ;
+  char **environ;
 #else
 #include <crt_externs.h> // _NSGetEnviron
 #endif
