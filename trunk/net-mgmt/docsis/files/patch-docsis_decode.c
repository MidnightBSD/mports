# $FreeBSD: ports/net-mgmt/docsis/files/patch-docsis_decode.c,v 1.4 2007/07/10 22:13:34 pav Exp $
--- src/docsis_decode.c.orig	Mon Aug  1 07:30:42 2005
+++ src/docsis_decode.c	Sun Jun 10 18:24:22 2007
@@ -22,6 +22,7 @@
 
 #include <math.h>
 #include <ctype.h>
+#include <string.h>
 
 /* #include "docsis.h" */
 #include "docsis_decode.h"
