--- DriverManager/SQLNativeSqlW.c.orig	2018-05-30 09:19:59 UTC
+++ DriverManager/SQLNativeSqlW.c
@@ -100,7 +100,7 @@
 {
     DMHDBC connection = (DMHDBC)hdbc;
     SQLRETURN ret;
-    SQLCHAR *s1;
+    SQLCHAR s1[ 100 + LOG_MESSAGE_LEN ];
     SQLCHAR s2[ 100 + LOG_MESSAGE_LEN ];
 
     /*
@@ -154,23 +154,6 @@
 
     if ( log_info.log_flag )
     {
-        /*
-         * allocate some space for the buffer
-         */
-
-        if ( sz_sql_str_in && cb_sql_str_in == SQL_NTS )
-        {
-            s1 = malloc(( wide_strlen( sz_sql_str_in ) * 2 ) + 100 );
-        }
-        else if ( sz_sql_str_in )
-        {
-            s1 = malloc( cb_sql_str_in + 100 );
-        }
-        else
-        {
-            s1 = malloc( 101 );
-        }
-
         sprintf( connection -> msg, "\n\t\tEntry:\
 \n\t\t\tConnection = %p\
 \n\t\t\tSQL In = %s\
@@ -183,8 +166,6 @@
                 (int)cb_sql_str_max,
                 pcb_sql_str );
 
-        free( s1 );
-
         dm_log_write( __FILE__, 
                 __LINE__, 
                 LOG_INFO, 
@@ -325,27 +306,6 @@
 
     if ( log_info.log_flag )
     {
-        /*
-         * allocate some space for the buffer
-         */
-
-        if ( sz_sql_str && pcb_sql_str && *pcb_sql_str == SQL_NTS )
-        {
-            s1 = malloc( wide_strlen( sz_sql_str ) * 2 + 100 );
-        }
-        else if ( sz_sql_str &&  pcb_sql_str )
-        {
-            s1 = malloc( *pcb_sql_str + 100 );
-        }
-        else if ( sz_sql_str )
-        {
-            s1 = malloc( wide_strlen( sz_sql_str ) * 2 + 100 );
-        }
-        else
-        {
-            s1 = malloc( 101 );
-        }
-
         sprintf( connection -> msg, 
                 "\n\t\tExit:[%s]\
 \n\t\t\tSQL Out = %s",
@@ -353,8 +313,6 @@
                     __idata_as_string( s1, SQL_CHAR, 
                         pcb_sql_str, sz_sql_str ));
 
-        free( s1 );
-
         dm_log_write( __FILE__, 
                 __LINE__, 
                 LOG_INFO, 
