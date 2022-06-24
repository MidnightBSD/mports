--- jdk/src/solaris/native/sun/security/jgss/wrapper/NativeFunc.h.orig	2020-04-19 09:44:43 UTC
+++ jdk/src/solaris/native/sun/security/jgss/wrapper/NativeFunc.h
@@ -265,6 +265,6 @@ typedef struct GSS_FUNCTION_TABLE {
 typedef GSS_FUNCTION_TABLE *GSS_FUNCTION_TABLE_PTR;
 
 /* global GSS function table */
-GSS_FUNCTION_TABLE_PTR ftab;
+extern GSS_FUNCTION_TABLE_PTR ftab;
 
 #endif
