--- DriverManager/SQLPrepare.c.orig	2018-05-30 09:19:59 UTC
+++ DriverManager/SQLPrepare.c
@@ -145,7 +145,7 @@
 {
     DMHSTMT statement = (DMHSTMT) statement_handle;
     SQLRETURN ret;
-    SQLCHAR *s1;
+    SQLCHAR s1[ 100 + LOG_MESSAGE_LEN ];
     SQLCHAR s2[ 100 + LOG_MESSAGE_LEN ];
 
     /*
@@ -167,30 +167,11 @@
 
     if ( log_info.log_flag )
     {
-        /*
-         * allocate some space for the buffer
-         */
-
-        if ( statement_text && text_length == SQL_NTS )
-        {
-            s1 = malloc( strlen((char*) statement_text ) + 100 );
-        }
-        else if ( statement_text )
-        {
-            s1 = malloc( text_length + 100 );
-        }
-        else
-        {
-            s1 = malloc( 101 );
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
