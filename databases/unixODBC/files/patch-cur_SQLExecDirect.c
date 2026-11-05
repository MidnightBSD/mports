--- cur/SQLExecDirect.c.orig	2021-04-17 09:47:28 UTC
+++ cur/SQLExecDirect.c
@@ -64,6 +64,7 @@
  **********************************************************************/
 
 #include <config.h>
+#include <limits.h>
 #include "cursorlibrary.h"
 
 /*
@@ -128,6 +129,26 @@
 int calculate_buffers( CLHSTMT cl_statement, int column_count )
 {
     CLBCOL *bcol;
+    SQLLEN row_length = sizeof( SQLUSMALLINT );
+
+    /* Validate all offsets before changing cached rowset state. */
+    for ( bcol = cl_statement -> bound_columns; bcol; bcol = bcol -> next )
+    {
+        if ( bcol -> column_number <= column_count )
+        {
+            if ( bcol -> bound_length < 0 ||
+                 bcol -> bound_length > INT_MAX - (SQLLEN)sizeof( SQLULEN ) ||
+                 row_length > INT_MAX - (SQLLEN)sizeof( SQLULEN ) - bcol -> bound_length )
+            {
+                cl_statement -> cl_connection -> dh.__post_internal_error( &cl_statement -> dm_statement -> error,
+                        ERROR_HY090, NULL,
+                        cl_statement -> dm_statement -> connection ->
+                            environment -> requested_version );
+                return SQL_ERROR;
+            }
+            row_length += bcol -> bound_length + sizeof( SQLULEN );
+        }
+    }
 
     cl_statement -> rowset_position = CL_BEFORE_START;
     cl_statement -> rowset_count = 0;
