--- DriverManager/SQLSetEnvAttr.c.orig	2023-05-19 08:43:23 UTC
+++ DriverManager/SQLSetEnvAttr.c
@@ -153,7 +153,7 @@
     {
         if ( attribute == SQL_ATTR_CONNECTION_POOLING ) {
             if ((SQLLEN) value == SQL_CP_ONE_PER_DRIVER || (SQLLEN) value == SQL_CP_ONE_PER_HENV ) {
-                pooling_enabled = 1;
+                __atomic_store_n( &pooling_enabled, 1, __ATOMIC_RELAXED );
             }
         }
         return SQL_SUCCESS;
