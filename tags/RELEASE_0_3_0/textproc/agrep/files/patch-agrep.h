
$FreeBSD: ports/textproc/agrep/files/patch-agrep.h,v 1.1 2002/07/21 01:56:56 naddy Exp $

--- agrep.h.orig	Fri Jan 17 20:15:13 1992
+++ agrep.h	Sun Jul 21 03:50:47 2002
@@ -1,10 +1,10 @@
 #include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
 #include <math.h>
 #include <ctype.h>
 #include "re.h"
 
-extern unsigned char *strcpy(), *strncpy(), *strcat();
-extern int strlen();
 #define CHAR	unsigned char
 #define MAXPAT 128
 #define MAXPATT 256
