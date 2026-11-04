--- src/xmlstar.h.orig	2009-06-24 12:26:32 UTC
+++ src/xmlstar.h
@@ -32,7 +32,7 @@
     Verbosity verbose;
     ErrorStop stop;
 } ErrorInfo;
 
-void reportError(void *ptr, xmlErrorPtr error);
+void reportError(void *ptr, const xmlError *error);
 void suppressErrors(void);
