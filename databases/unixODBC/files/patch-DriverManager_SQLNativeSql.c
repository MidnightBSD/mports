--- DriverManager/SQLNativeSql.c.orig	2018-05-30 09:19:59 UTC
+++ DriverManager/SQLNativeSql.c
@@ -162,7 +162,7 @@
 {
     DMHDBC connection = (DMHDBC)hdbc;
     SQLRETURN ret;
-    SQLCHAR *s1;
+    SQLCHAR s1[ 100 + LOG_MESSAGE_LEN ];
     SQLCHAR s2[ 100 + LOG_MESSAGE_LEN ];
 
     /*
@@ -184,23 +184,6 @@
 
     if ( log_info.log_flag )
     {
-        /*
-         * allocate some space for the buffer
-         */
-
-        if ( sz_sql_str_in && cb_sql_str_in == SQL_NTS )
-        {
-            s1 = malloc( strlen((char*) sz_sql_str_in ) + 100 );
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
@@ -213,8 +196,6 @@
                 (int)cb_sql_str_max,
                 pcb_sql_str );
 
-        free( s1 );
-
         dm_log_write( __FILE__, 
                 __LINE__, 
                 LOG_INFO, 
@@ -353,27 +334,6 @@
     }
     if ( log_info.log_flag )
     {
-        /*
-         * allocate some space for the buffer
-         */
-
-        if ( sz_sql_str && pcb_sql_str && *pcb_sql_str == SQL_NTS )
-        {
-            s1 = malloc( strlen((char*) sz_sql_str ) + 100 );
-        }
-        else if ( sz_sql_str &&  pcb_sql_str )
-        {
-            s1 = malloc( *pcb_sql_str + 100 );
-        }
-        else if ( sz_sql_str )
-        {
-            s1 = malloc( strlen((char*) sz_sql_str ) + 100 );
-        }
-        else
-        {
-            s1 = malloc( 101 );
-        }
-
         sprintf( connection -> msg, 
                 "\n\t\tExit:[%s]\
 \n\t\t\tSQL Out = %s",
@@ -381,8 +341,6 @@
                     __idata_as_string( s1, SQL_CHAR, 
                         pcb_sql_str, sz_sql_str ));
 
-        free( s1 );
-
         dm_log_write( __FILE__, 
                 __LINE__, 
                 LOG_INFO, 
