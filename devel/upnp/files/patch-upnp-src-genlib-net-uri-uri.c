--- upnp/src/genlib/net/uri/uri.c.orig	2019-12-31 12:26:36.343213000 -0500
+++ upnp/src/genlib/net/uri/uri.c	2019-12-31 12:41:25.055432000 -0500
@@ -38,12 +38,6 @@
  */
 
 
-#ifdef __FreeBSD__
-	#include <osreldate.h>
-	#if __FreeBSD_version < 601103
-		#include <lwres/netdb.h>
-	#endif
-#endif
 #ifdef _WIN32
 	#define snprintf _snprintf
 #endif
