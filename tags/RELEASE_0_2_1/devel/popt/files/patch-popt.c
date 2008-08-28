
$FreeBSD: ports/devel/popt/files/patch-popt.c,v 1.1 2001/02/09 17:49:10 sobomax Exp $

--- popt.c	2001/01/31 09:50:38	1.1
+++ popt.c	2001/01/31 09:51:08
@@ -5,6 +5,9 @@
 #include "system.h"
 
 #include <math.h>
+#ifdef __FreeBSD__
+#include <machine/float.h>
+#endif
 
 #include "findme.h"
 #include "poptint.h"
