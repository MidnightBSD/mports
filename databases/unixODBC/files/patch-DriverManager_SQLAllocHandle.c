--- DriverManager/SQLAllocHandle.c.orig	2023-07-17 09:36:54 UTC
+++ DriverManager/SQLAllocHandle.c
@@ -306,23 +306,23 @@
                 ( toupper( pooling_string[ 0 ] ) == 'O' &&
                     toupper( pooling_string[ 1 ] ) == 'N' ))
             {
-                pooling_enabled = 1;
+                __atomic_store_n( &pooling_enabled, 1, __ATOMIC_RELAXED );
             }
 
 #ifdef WITH_SHARDENV
-            if ( pooling_enabled )
+            if ( __atomic_load_n( &pooling_enabled, __ATOMIC_RELAXED ) )
             {
                 int first;
             
                 SQLGetPrivateProfileString( "ODBC", "PoolMaxSize", "0",
                     pool_max_size_string, sizeof( pool_max_size_string ),
                     "ODBCINST.INI" );
-                pool_max_size = atoi( pool_max_size_string );
+                __atomic_store_n( &pool_max_size, atoi( pool_max_size_string ), __ATOMIC_RELAXED );
 
                 SQLGetPrivateProfileString( "ODBC", "PoolWaitTimeout", "30",
                     pool_wait_timeout_string, sizeof( pool_wait_timeout_string ),
                     "ODBCINST.INI" );
-                pool_wait_timeout = atoi( pool_wait_timeout_string );
+                __atomic_store_n( &pool_wait_timeout, atoi( pool_wait_timeout_string ), __ATOMIC_RELAXED );
 
                 if ( !( environment = __share_env( &first )))
                 {
@@ -384,19 +384,19 @@
            }
 #else
 
-            if ( pooling_enabled )
+            if ( __atomic_load_n( &pooling_enabled, __ATOMIC_RELAXED ) )
             {
                 int first;
             
                 SQLGetPrivateProfileString( "ODBC", "PoolMaxSize", "0",
                     pool_max_size_string, sizeof( pool_max_size_string ),
                     "ODBCINST.INI" );
-                pool_max_size = atoi( pool_max_size_string );
+                __atomic_store_n( &pool_max_size, atoi( pool_max_size_string ), __ATOMIC_RELAXED );
 
                 SQLGetPrivateProfileString( "ODBC", "PoolWaitTimeout", "30",
                     pool_wait_timeout_string, sizeof( pool_wait_timeout_string ),
                     "ODBCINST.INI" );
-                pool_wait_timeout = atoi( pool_wait_timeout_string );
+                __atomic_store_n( &pool_wait_timeout, atoi( pool_wait_timeout_string ), __ATOMIC_RELAXED );
             }
 
             if ( !( environment = __alloc_env()))
