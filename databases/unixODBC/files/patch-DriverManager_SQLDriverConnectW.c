--- DriverManager/SQLDriverConnectW.c.orig	2023-01-05 13:34:01 UTC
+++ DriverManager/SQLDriverConnectW.c
@@ -461,7 +461,7 @@
 
     connection -> pooled_connection = NULL;
 
-    if ( pooling_enabled ) {
+    if ( __atomic_load_n( &pooling_enabled, __ATOMIC_RELAXED ) ) {
         char *ansi_conn_str_in;
         int clen;
         int retpool;
@@ -549,7 +549,7 @@
             /*
              * either no timeout or exceeded the timeout
              */
-            if ( ! pool_wait_timeout || time( NULL ) - wait_begin > pool_wait_timeout )
+            if ( ! __atomic_load_n( &pool_wait_timeout, __ATOMIC_RELAXED ) || time( NULL ) - wait_begin > __atomic_load_n( &pool_wait_timeout, __ATOMIC_RELAXED ) )
             {
                 free( ansi_conn_str_in );
 
@@ -1098,7 +1098,7 @@
         ret_from_connect = SQL_SUCCESS_WITH_INFO;
     }
 
-    if ( pooling_enabled  && !add_to_pool( connection, pooh ) )
+    if ( __atomic_load_n( &pooling_enabled, __ATOMIC_RELAXED )  && !add_to_pool( connection, pooh ) )
     {
         pool_unreserve( pooh );
     }
