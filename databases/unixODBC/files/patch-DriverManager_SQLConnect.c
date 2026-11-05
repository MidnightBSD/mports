--- DriverManager/SQLConnect.c.orig	2023-05-18 20:52:38 UTC
+++ DriverManager/SQLConnect.c
@@ -3699,7 +3699,7 @@
     /* this head is the right one, but is it full ? */
     if ( match_head )
     {
-        if ( pool_max_size && match_head -> num_entries >= pool_max_size )
+        if ( __atomic_load_n( &pool_max_size, __ATOMIC_RELAXED ) && match_head -> num_entries >= __atomic_load_n( &pool_max_size, __ATOMIC_RELAXED ) )
         {
             /* Note we do NOT exit pool mutex here, as wait will exit it automatically */
             return 2;
@@ -4122,7 +4122,7 @@
 
     connection -> pooled_connection = NULL;
 
-    if ( pooling_enabled )
+    if ( __atomic_load_n( &pooling_enabled, __ATOMIC_RELAXED ) )
     {
         int retpool;
         int retrying = 0;
@@ -4167,7 +4167,7 @@
             /*
              * either no timeout or exceeded the timeout
              */
-            if ( ! pool_wait_timeout || time( NULL ) - wait_begin > pool_wait_timeout )
+            if ( ! __atomic_load_n( &pool_wait_timeout, __ATOMIC_RELAXED ) || time( NULL ) - wait_begin > __atomic_load_n( &pool_wait_timeout, __ATOMIC_RELAXED ) )
             {
                 mutex_pool_exit();
                 dm_log_write( __FILE__,
@@ -4200,7 +4200,7 @@
      * else safe the info for later
      */
 
-    if ( pooling_enabled )
+    if ( __atomic_load_n( &pooling_enabled, __ATOMIC_RELAXED ) )
     {
         connection -> dsn_length = 0;
 
@@ -4656,7 +4656,7 @@
         ret_from_connect = SQL_SUCCESS_WITH_INFO;
     }
 
-    if ( pooling_enabled && !add_to_pool( connection, pooh ) )
+    if ( __atomic_load_n( &pooling_enabled, __ATOMIC_RELAXED ) && !add_to_pool( connection, pooh ) )
     {
         pool_unreserve( pooh );
     }
