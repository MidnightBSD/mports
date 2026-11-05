--- cur/SQLBindCol.c.orig	2018-01-02 10:48:19 UTC
+++ cur/SQLBindCol.c
@@ -74,6 +74,7 @@
  **********************************************************************/
 
 #include <config.h>
+#include <limits.h>
 #include "cursorlibrary.h"
 
 /*
@@ -105,7 +106,7 @@
     return 0;
 }
 
-static int get_bound_length( int target_type, int len )
+static SQLLEN get_bound_length( int target_type, SQLLEN len )
 {
     switch( target_type )
     {
@@ -179,7 +180,10 @@
 {
     CLHSTMT cl_statement = (CLHSTMT) statement_handle; 
     CLBCOL *bcol;
-    int b_len;
+    int new_column = 0;
+    SQLLEN b_len;
+    SQLLEN old_len_ind;
+    SQLPOINTER new_buffer = NULL;
     SQLRETURN ret;
 
 	if ( cl_statement -> not_from_select )
@@ -193,6 +197,17 @@
 			strlen_or_ind );
 	}
 
+    /* The rowset offsets are int, so larger bindings cannot be represented. */
+    b_len = get_bound_length( target_type, buffer_length );
+    if ( buffer_length < 0 || b_len < 0 || b_len > INT_MAX )
+    {
+        cl_statement -> cl_connection -> dh.__post_internal_error( &cl_statement -> dm_statement -> error,
+                ERROR_HY090, NULL,
+                cl_statement -> dm_statement -> connection ->
+                    environment -> requested_version );
+        return SQL_ERROR;
+    }
+
     /*
      * check in the list of bound columns for a entry
      */
@@ -227,6 +242,69 @@
         memset( bcol, 0, sizeof( CLBCOL ));
         bcol -> column_number = column_number;
 
+        new_column = 1;
+    }
+
+    /*
+     * setup bound info
+     */
+
+    /*
+     * find length
+     */
+
+    /* Allocate first so a failed rebind leaves the previous binding usable. */
+    if ( target_value && b_len > 0 )
+    {
+        new_buffer = malloc( (size_t)b_len );
+        if ( !new_buffer )
+        {
+            if ( new_column )
+                free( bcol );
+            cl_statement -> cl_connection -> dh.__post_internal_error( &cl_statement -> dm_statement -> error,
+                    ERROR_HY001, NULL,
+                    cl_statement -> dm_statement -> connection ->
+                        environment -> requested_version );
+            return SQL_ERROR;
+        }
+    }
+
+    old_len_ind = bcol -> len_ind;
+
+    /* Bind the replacement before discarding a working binding. */
+    if ( column_number > 0 )
+    {
+        ret = SQLBINDCOL( cl_statement -> cl_connection,
+               cl_statement -> driver_stmt,
+               column_number,
+               target_type,
+               new_buffer,
+               b_len,
+               &bcol -> len_ind );
+    }
+    else
+    {
+        ret = SQL_SUCCESS;
+    }
+
+    if ( !SQL_SUCCEEDED( ret ))
+    {
+        bcol -> len_ind = old_len_ind;
+        free( new_buffer );
+        if ( new_column )
+            free( bcol );
+        return ret;
+    }
+
+    free( bcol -> local_buffer );
+    bcol -> local_buffer = new_buffer;
+    bcol -> bound_buffer = target_value;
+    bcol -> bound_length = b_len;
+    bcol -> bound_type = target_type;
+    bcol -> bound_ind = strlen_or_ind;
+
+    if ( new_column )
+    {
         /*
          * insert into to list
          */
@@ -263,68 +341,6 @@
     }
 
     /*
-     * setup bound info
-     */
-
-    /*
-     * find length
-     */
-
-    b_len = get_bound_length( target_type, buffer_length );
-
-    if ( bcol -> local_buffer )
-    {
-        free( bcol -> local_buffer );
-    }
-    bcol -> local_buffer = NULL;
-
-    if ( target_value && b_len > 0 )
-    {
-        bcol -> local_buffer = malloc( b_len );
-        if ( !bcol -> local_buffer )
-        {
-            cl_statement -> cl_connection -> dh.__post_internal_error( &cl_statement -> dm_statement -> error,
-                    ERROR_HY001, NULL,
-                    cl_statement -> dm_statement -> connection -> 
-                        environment -> requested_version );
-
-            return SQL_ERROR;
-        }
-    }
-
-    bcol -> bound_buffer = target_value;
-    bcol -> bound_length = b_len;
-    bcol -> bound_type = target_type;
-
-    if ( strlen_or_ind )
-    {
-        bcol -> bound_ind = strlen_or_ind;
-    }
-    else
-    {
-        bcol -> bound_ind = NULL;
-    }
-
-    /*
-     * call the driver to bind a column, but not bookmarks
-     */
-
-    if ( column_number > 0 )
-    {
-        ret = SQLBINDCOL( cl_statement -> cl_connection,
-               cl_statement -> driver_stmt,
-               column_number,
-               target_type,
-               bcol -> local_buffer,
-               bcol -> bound_length,
-               &bcol -> len_ind );
-    }
-    else
-    {
-        ret = SQL_SUCCESS;
-    }
-
-    /*
      * are we unbinding ?
      */
 
