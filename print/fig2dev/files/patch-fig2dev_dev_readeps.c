--- fig2dev/dev/readeps.c.orig	2023-05-22 17:37:22 UTC
+++ fig2dev/dev/readeps.c
@@ -29,6 +29,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <math.h>
+#include <sys/wait.h>
 
 #include "fig2dev.h"	/* includes bool.h and object.h */
 //#include "object.h"
