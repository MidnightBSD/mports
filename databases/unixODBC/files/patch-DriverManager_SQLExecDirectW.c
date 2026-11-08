--- DriverManager/SQLExecDirectW.c.orig	2018-10-24 13:48:25 UTC
+++ DriverManager/SQLExecDirectW.c
@@ -97,7 +97,7 @@
 {
     DMHSTMT statement = (DMHSTMT) statement_handle;
     SQLRETURN ret;
-    SQLCHAR *s1;
+    SQLCHAR s1[ 100 + LOG_MESSAGE_LEN ];
     SQLCHAR s2[ 100 + LOG_MESSAGE_LEN ];
 
     /*
@@ -148,30 +148,11 @@
 
     if ( log_info.log_flag )
     {
-        /*
-         * allocate some space for the buffer
-         */
-
-        if ( statement_text && text_length == SQL_NTS )
-        {
-             s1 = malloc( wide_strlen( statement_text ) * 2 + LOG_MESSAGE_LEN * 2 );
-        }
-        else if ( statement_text )
-        {
-            s1 = malloc( text_length + LOG_MESSAGE_LEN * 2 );
-        }
-        else
-        {
-            s1 = malloc( LOG_MESSAGE_LEN * 2 );
-        }
-
         sprintf( statement -> msg, "\n\t\tEntry:\
 \n\t\t\tStatement = %p\
 \n\t\t\tSQL = %s",
                 statement,
                 __wstring_with_length( s1, statement_text, text_length ));
-
-        free( s1 );
 
         dm_log_write( __FILE__, 
                 __LINE__, 
