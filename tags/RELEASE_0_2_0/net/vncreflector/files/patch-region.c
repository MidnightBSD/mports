
$FreeBSD: ports/net/vncreflector/files/patch-region.c,v 1.1 2005/01/20 10:35:48 brooks Exp $

--- region.c.orig
+++ region.c
@@ -70,6 +70,7 @@
 *                                                               *
 *****************************************************************/
 
+#include <sys/types.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
