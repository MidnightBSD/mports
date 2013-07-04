--- embedding/base/nsEmbedAPI.cpp.orig	2007-10-09 20:00:30.000000000 -0400
+++ embedding/base/nsEmbedAPI.cpp	2007-10-09 20:01:45.000000000 -0400
@@ -53,7 +53,12 @@ static PRBool             sRegistryIniti
 static PRUint32           sInitCounter = 0;
 
 #define HACK_AROUND_THREADING_ISSUES
-//#define HACK_AROUND_NONREENTRANT_INITXPCOM
+#ifdef __MidnightBSD__
+#include <sys/param.h>
+#if __MidnightBSD_version < 3000
+#define HACK_AROUND_NONREENTRANT_INITXPCOM
+#endif
+#endif
 
 #ifdef HACK_AROUND_NONREENTRANT_INITXPCOM
 // XXX hack class to clean up XPCOM when this module is unloaded
