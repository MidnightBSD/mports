--- exe/isql.c.orig	2022-11-01 13:17:40 UTC
+++ exe/isql.c
@@ -1,3 +1,5 @@
+#include <errno.h>
+#include <limits.h>
 
 /**************************************************
  * isql
@@ -66,6 +68,21 @@
 int     max_col_size                = MAX_DATA_WIDTH;
 SQLUSMALLINT    has_moreresults     = 1;
 
+/* Leave room for display separators and terminating bytes in int arithmetic. */
+static int positive_size( const char *text )
+{
+    char *end;
+    long value;
+    errno = 0;
+    value = strtol( text, &end, 10 );
+    if ( errno || end == text || *end || value <= 0 || value > INT_MAX - 21 )
+    {
+        fputs( "isql: invalid size option\n", stderr );
+        exit( 1 );
+    }
+    return (int)value;
+}
+
 int main( int argc, char *argv[] )
 {
     int     nArg, count;
@@ -119,10 +136,10 @@
                     cDelimiter = argv[nArg][2];
                     break;
                 case 'm':
-                    nUserWidth = atoi( &(argv[nArg][2]) );
+                    nUserWidth = positive_size( &(argv[nArg][2]) );
                     break;
                 case 's':
-                    buffer_size = atoi( &(argv[nArg][2]) );
+                    buffer_size = positive_size( &(argv[nArg][2]) );
                     line_buffer_size = buffer_size;
                     break;
                 case 'w':
@@ -153,7 +170,7 @@
                     buseED = 1;
                     break;
                 case 'L':
-                    max_col_size = atoi( &(argv[nArg][2]) );
+                    max_col_size = positive_size( &(argv[nArg][2]) );
                     break;
                 case '-':
                     printf( "unixODBC " VERSION "\n" );
@@ -1861,13 +1878,18 @@
     {
         p = NULL;
 
+        if (nargs >= maxarg)
+        {
+            free(copy);
+            return maxarg;
+        }
+
         if (strcmp(arg, "\"\"") == 0)
             args[nargs++] = strdup("");
         else if (strcmp(arg, "null") == 0)
             args[nargs++] = NULL;
         else
             args[nargs++] = strdup(arg);
-        if (nargs > maxarg) return maxarg;
     }
     free(copy);
     return nargs;
