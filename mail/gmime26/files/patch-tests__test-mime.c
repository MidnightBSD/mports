--- tests/test-mime.c.orig	2016-12-09 15:08:58 UTC
+++ tests/test-mime.c
@@ -27,6 +27,7 @@
 #include <string.h>
 #include <ctype.h>
 
+#include <config.h>
 #include <gmime/gmime.h>
 
 #include "testsuite.h"
