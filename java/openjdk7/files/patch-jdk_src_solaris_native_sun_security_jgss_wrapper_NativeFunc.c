--- jdk/src/solaris/native/sun/security/jgss/wrapper/NativeFunc.c.orig	2020-04-19 09:44:43 UTC
+++ jdk/src/solaris/native/sun/security/jgss/wrapper/NativeFunc.c
@@ -28,6 +28,9 @@
 #include <dlfcn.h>
 #include "NativeFunc.h"
 
+/* global GSS function table */
+GSS_FUNCTION_TABLE_PTR ftab;
+
 /* standard GSS method names (ordering is from mapfile) */
 static const char RELEASE_NAME[]                = "gss_release_name";
 static const char IMPORT_NAME[]                 = "gss_import_name";
