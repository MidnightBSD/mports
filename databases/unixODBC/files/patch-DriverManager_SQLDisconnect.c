--- DriverManager/SQLDisconnect.c.orig	2021-05-10 08:41:45 UTC
+++ DriverManager/SQLDisconnect.c
@@ -285,7 +285,7 @@
      */
 
     if ( connection -> pooled_connection ||
-         pooling_enabled && connection -> pooling_timeout > 0 )
+         __atomic_load_n( &pooling_enabled, __ATOMIC_RELAXED ) && connection -> pooling_timeout > 0 )
     {
         __clean_stmt_from_dbc( connection );
         __clean_desc_from_dbc( connection );
