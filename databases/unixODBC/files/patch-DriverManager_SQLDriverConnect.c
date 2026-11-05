--- DriverManager/SQLDriverConnect.c.orig	2023-05-18 21:00:57 UTC
+++ DriverManager/SQLDriverConnect.c
@@ -895,7 +895,7 @@
 
     connection -> pooled_connection = NULL;
 
-    if ( pooling_enabled )
+    if ( __atomic_load_n( &pooling_enabled, __ATOMIC_RELAXED ) )
     {
         int retpool;
         int retrying = 0;
@@ -979,7 +979,7 @@
             /*
              * either no timeout or exceeded the timeout
              */
-            if ( ! pool_wait_timeout || time( NULL ) - wait_begin > pool_wait_timeout )
+            if ( ! __atomic_load_n( &pool_wait_timeout, __ATOMIC_RELAXED ) || time( NULL ) - wait_begin > __atomic_load_n( &pool_wait_timeout, __ATOMIC_RELAXED ) )
             {
                 mutex_pool_exit();
                 dm_log_write( __FILE__,
@@ -1014,7 +1014,7 @@
      * else save the info for later
      */
 
-    if ( pooling_enabled )
+    if ( __atomic_load_n( &pooling_enabled, __ATOMIC_RELAXED ) )
     {
         connection -> dsn_length = 0;
 
@@ -1925,7 +1925,7 @@
         ret_from_connect = SQL_SUCCESS_WITH_INFO;
     }
 
-    if ( pooling_enabled  && !add_to_pool( connection, pooh ) )
+    if ( __atomic_load_n( &pooling_enabled, __ATOMIC_RELAXED )  && !add_to_pool( connection, pooh ) )
     {
         pool_unreserve( pooh );
     }
