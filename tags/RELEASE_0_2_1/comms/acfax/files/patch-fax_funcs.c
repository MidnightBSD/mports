$FreeBSD: ports/comms/acfax/files/patch-fax_funcs.c,v 1.1 2002/06/08 04:53:25 petef Exp $

--- fax_funcs.c.orig	Sat Jun  8 00:39:02 2002
+++ fax_funcs.c	Sat Jun  8 00:39:08 2002
@@ -37,6 +37,8 @@
 #include "widgets.h"
 #include "fax_funcs.h"
 
+#define PI M_PI
+
 /* some variables that are allowed to be global */
 int	lpm;		/* lines per minute */
 int     ixoc;           /* number of pixels of one scan-line / PI */
