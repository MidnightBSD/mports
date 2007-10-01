
$FreeBSD: ports/net-mgmt/docsis/files/patch-ethermac.h,v 1.1 2003/05/07 01:40:46 leeym Exp $

--- ethermac.h.orig	Wed Feb 13 14:09:52 2002
+++ ethermac.h	Thu Feb 27 19:14:53 2003
@@ -22,6 +22,7 @@
 
 #include <stdio.h>
 #include <string.h>
+#include <stdlib.h>
 
 int ether_aton ( const char *macstr, unsigned char *outbuf ) ;
 char * ether_ntoa ( const unsigned char *mac);
