--- DriverManager/SQLConnectW.c.orig	2021-06-17 07:52:51 UTC
+++ DriverManager/SQLConnectW.c
@@ -327,7 +327,7 @@
 
     connection -> pooled_connection = NULL;
 
-    if ( pooling_enabled ) {
+    if ( __atomic_load_n( &pooling_enabled, __ATOMIC_RELAXED ) ) {
 
         char *ansi_server_name, *ansi_user_name, *ansi_authentication;
         int ansi_name_length1, ansi_name_length2, ansi_name_length3;
@@ -411,7 +411,7 @@
             /*
              * either no timeout or exceeded the timeout
              */
-            if ( ! pool_wait_timeout || time( NULL ) - wait_begin > pool_wait_timeout )
+            if ( ! __atomic_load_n( &pool_wait_timeout, __ATOMIC_RELAXED ) || time( NULL ) - wait_begin > __atomic_load_n( &pool_wait_timeout, __ATOMIC_RELAXED ) )
             {
                 if ( ansi_server_name ) {
                     free( ansi_server_name );
@@ -608,7 +608,7 @@
         if ( user_name )
         {
             if ( name_length2 == SQL_NTS )
-                unicode_to_ansi_copy((char*) ansi_user, sizeof( ansi_user ),user_name, sizeof( ansi_user ), connection, NULL);
+                unicode_to_ansi_copy((char*) ansi_user, sizeof( ansi_user ),user_name, SQL_NTS, connection, NULL);
             else
                 unicode_to_ansi_copy((char*) ansi_user, sizeof( ansi_user ),user_name, name_length2, connection, NULL );
         }
@@ -616,7 +616,7 @@
         if ( authentication )
         {
             if ( name_length3 == SQL_NTS )
-                unicode_to_ansi_copy((char*) ansi_pwd, sizeof( ansi_pwd ), authentication, sizeof( ansi_pwd ), connection, NULL);
+                unicode_to_ansi_copy((char*) ansi_pwd, sizeof( ansi_pwd ), authentication, SQL_NTS, connection, NULL);
             else
                 unicode_to_ansi_copy((char*) ansi_pwd, sizeof( ansi_pwd ), authentication, name_length3, connection, NULL );
         }
@@ -889,7 +889,7 @@
         ret_from_connect = SQL_SUCCESS_WITH_INFO;
     }
 
-    if ( pooling_enabled && !add_to_pool( connection, pooh ) )
+    if ( __atomic_load_n( &pooling_enabled, __ATOMIC_RELAXED ) && !add_to_pool( connection, pooh ) )
     {
         pool_unreserve( pooh );
     }
