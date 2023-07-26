--- fig2dev/dev/readpics.c.orig	2023-05-22 17:36:40 UTC
+++ fig2dev/dev/readpics.c
@@ -31,6 +31,7 @@
 #include <string.h>
 #include <unistd.h>
 #include <sys/stat.h>
+#include <sys/wait.h>
 
 #include "messages.h"
 #include "xtmpfile.h"
