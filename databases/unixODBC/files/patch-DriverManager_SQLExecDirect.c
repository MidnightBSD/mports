--- DriverManager/SQLExecDirect.c.orig	2018-10-24 13:48:42 UTC
+++ DriverManager/SQLExecDirect.c
@@ -189,7 +189,7 @@
 {
     DMHSTMT statement = (DMHSTMT) statement_handle;
     SQLRETURN ret;
-    SQLCHAR *s1;
+    SQLCHAR s1[ 100 + LOG_MESSAGE_LEN ];
     SQLCHAR s2[ 100 + LOG_MESSAGE_LEN ];
 
     /*
@@ -211,30 +211,11 @@
 
     if ( log_info.log_flag )
     {
-        /*
-         * allocate some space for the buffer
-         */
-
-        if ( statement_text && text_length == SQL_NTS )
-        {
-            s1 = malloc( strlen((char*) statement_text ) + LOG_MESSAGE_LEN );
-        }
-        else if ( statement_text )
-        {
-            s1 = malloc( text_length + LOG_MESSAGE_LEN );
-        }
-        else
-        {
-            s1 = malloc( LOG_MESSAGE_LEN );
-        }
-
         sprintf( statement -> msg, "\n\t\tEntry:\
 \n\t\t\tStatement = %p\
 \n\t\t\tSQL = %s",
                 statement,
                 __string_with_length( s1, statement_text, text_length ));
-
-        free( s1 );
 
         dm_log_write( __FILE__, 
                 __LINE__, 
