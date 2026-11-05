--- cur/SQLExtendedFetch.c.orig	2021-08-05 17:17:14 UTC
+++ cur/SQLExtendedFetch.c
@@ -178,10 +178,13 @@
              * copy from the file buffer
              */
 
-            memcpy( cbuf -> local_buffer,
-                    cl_statement -> rowset_buffer + 
-                    cbuf -> rs_buffer_offset,
-                    cbuf -> bound_length );
+            if ( cbuf -> local_buffer && cbuf -> bound_length > 0 )
+            {
+                memcpy( cbuf -> local_buffer,
+                        cl_statement -> rowset_buffer + 
+                        cbuf -> rs_buffer_offset,
+                        cbuf -> bound_length );
+            }
 
             memcpy( &cbuf -> len_ind,
                     cl_statement -> rowset_buffer +
@@ -221,7 +224,7 @@
                     }
                 }
 
-                if ( buffer && cbuf -> len_ind >= 0 )
+                if ( buffer && cbuf -> local_buffer && cbuf -> bound_length > 0 && cbuf -> len_ind >= 0 )
                 {
                     if ( cbuf -> bound_type == SQL_C_CHAR )
                     {
@@ -296,10 +299,13 @@
                  * copy to the file buffer
                  */
 
-                memcpy( cl_statement -> rowset_buffer + 
-                        cbuf -> rs_buffer_offset,
-                        cbuf -> local_buffer,
-                        cbuf -> bound_length );
+                if ( cbuf -> local_buffer && cbuf -> bound_length > 0 )
+                {
+                    memcpy( cl_statement -> rowset_buffer + 
+                            cbuf -> rs_buffer_offset,
+                            cbuf -> local_buffer,
+                            cbuf -> bound_length );
+                }
 
                 memcpy( cl_statement -> rowset_buffer +
                         cbuf -> rs_ind_offset,
@@ -345,7 +351,7 @@
                      * 
                     if ( buffer && cbuf -> bound_ind && *cbuf -> bound_ind >= 0 )
                     */
-                    if ( buffer && cbuf -> bound_ind )
+                    if ( buffer && cbuf -> local_buffer && cbuf -> bound_length > 0 && cbuf -> bound_ind )
                     {
                         if ( cbuf -> bound_type == SQL_C_CHAR )
                         {
