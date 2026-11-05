--- DriverManager/__info.c.orig	2023-06-07 10:18:32 UTC
+++ DriverManager/__info.c
@@ -3222,6 +3222,10 @@
     {
         sprintf((char*) ostr, "[NULL]" );
     }
+    else if ( len < 0 && len != SQL_NTS )
+    {
+        sprintf((char*) ostr, "[invalid length = %d]", (int)len );
+    }
     else if ( len == SQL_NTS )
     {
         if ( strlen((char*) instr ) > LOG_MESSAGE_LEN )
@@ -3255,6 +3259,10 @@
     if ( instr == NULL )
     {
         sprintf((char*) ostr, "[NULL]" );
+    }
+    else if ( len < 0 && len != SQL_NTS )
+    {
+        sprintf((char*) ostr, "[invalid length = %d]", (int)len );
     }
     else if ( len == SQL_NTS )
     {
