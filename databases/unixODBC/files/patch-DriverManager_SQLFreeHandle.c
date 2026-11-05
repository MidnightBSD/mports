--- DriverManager/SQLFreeHandle.c.orig	2023-07-18 08:32:51 UTC
+++ DriverManager/SQLFreeHandle.c
@@ -184,7 +184,7 @@
 
 extern int pooling_enabled;
 
-SQLRETURN __SQLFreeHandle( SQLSMALLINT handle_type,
+static SQLRETURN free_handle( SQLSMALLINT handle_type,
         SQLHANDLE handle )
 {
     switch( handle_type )
@@ -231,7 +231,7 @@
             thread_protect( SQL_HANDLE_ENV, environment );
 
 #ifdef WITH_SHARDENV
-            if ( pooling_enabled == 0 ) {
+            if ( __atomic_load_n( &pooling_enabled, __ATOMIC_RELAXED ) == 0 ) {
                 /*
                  * check states
                  */
@@ -273,7 +273,7 @@
             thread_release( SQL_HANDLE_ENV, environment );
 
 #ifdef WITH_SHARDENV
-            if ( pooling_enabled == 0 ) {
+            if ( __atomic_load_n( &pooling_enabled, __ATOMIC_RELAXED ) == 0 ) {
                 /*
                  * release any pooled connections that are using this environment
                  */
@@ -656,6 +656,56 @@
     }
 }
 
+SQLRETURN __SQLFreeHandle( SQLSMALLINT handle_type, SQLHANDLE handle )
+{
+    struct free_claim
+    {
+        SQLHANDLE handle;
+        struct free_claim *next;
+    };
+    static struct free_claim *claims;
+    struct free_claim claim, *ptr, **link;
+    SQLRETURN ret;
+#ifdef HAVE_LIBPTHREAD
+    int old_cancel_state;
+
+    /* A cancelled driver callback must not leave a stack node in claims. */
+    pthread_setcancelstate( PTHREAD_CANCEL_DISABLE, &old_cancel_state );
+#endif
+
+    /* Claim the pointer before validation, without holding a lock across
+     * driver callbacks.  The stack node remains live until removal below. */
+    mutex_free_handle_entry();
+    for ( ptr = claims; ptr; ptr = ptr -> next )
+    {
+        if ( ptr -> handle == handle )
+        {
+            mutex_free_handle_exit();
+#ifdef HAVE_LIBPTHREAD
+            pthread_setcancelstate( old_cancel_state, NULL );
+#endif
+            return SQL_INVALID_HANDLE;
+        }
+    }
+    claim.handle = handle;
+    claim.next = claims;
+    claims = &claim;
+    mutex_free_handle_exit();
+
+    ret = free_handle( handle_type, handle );
+
+    /* Drop the claim on success and failure, so a failed free is retryable. */
+    mutex_free_handle_entry();
+    for ( link = &claims; *link != &claim; link = &( *link ) -> next )
+        ;
+    *link = claim.next;
+    mutex_free_handle_exit();
+#ifdef HAVE_LIBPTHREAD
+    pthread_setcancelstate( old_cancel_state, NULL );
+#endif
+    return ret;
+}
+
 SQLRETURN SQLFreeHandle( SQLSMALLINT handle_type,
         SQLHANDLE handle )
 {
