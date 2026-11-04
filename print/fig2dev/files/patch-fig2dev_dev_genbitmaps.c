--- fig2dev/dev/genbitmaps.c.orig	2023-05-22 17:37:44 UTC
+++ fig2dev/dev/genbitmaps.c
@@ -36,6 +36,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <signal.h>
+#include <sys/wait.h>
 
 #include "bool.h"
 #include "fig2dev.h"	/* includes bool.h and object.h */
