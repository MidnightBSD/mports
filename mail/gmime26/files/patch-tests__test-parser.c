--- tests/test-parser.c.orig	2016-12-09 15:08:58 UTC
+++ tests/test-parser.c
@@ -30,6 +30,7 @@
 #include <fcntl.h>
 #include <time.h>
 
+#include <config.h>
 #include <gmime/gmime.h>
 
 #if !defined (G_OS_WIN32) || defined (__MINGW32__)
