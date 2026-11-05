--- DriverManager/__handles.c.orig	2023-05-20 18:17:30 UTC
+++ DriverManager/__handles.c
@@ -279,6 +279,7 @@
 #include <pth.h>
 
 static pth_mutex_t mutex_lists = PTH_MUTEX_INIT;
+static pth_mutex_t mutex_free_handle = PTH_MUTEX_INIT;
 static pth_mutex_t mutex_env = PTH_MUTEX_INIT;
 static pth_mutex_t mutex_pool = PTH_MUTEX_INIT;
 static pth_mutex_t mutex_iconv = PTH_MUTEX_INIT;
@@ -317,6 +318,7 @@
 #include <pthread.h>
 
 static pthread_mutex_t mutex_lists = PTHREAD_MUTEX_INITIALIZER;
+static pthread_mutex_t mutex_free_handle = PTHREAD_MUTEX_INITIALIZER;
 static pthread_mutex_t mutex_env = PTHREAD_MUTEX_INITIALIZER;
 static pthread_mutex_t mutex_pool = PTHREAD_MUTEX_INITIALIZER;
 static pthread_mutex_t mutex_iconv = PTHREAD_MUTEX_INITIALIZER;
@@ -348,6 +350,7 @@
 #include <thread.h>
 
 static mutex_t mutex_lists;
+static mutex_t mutex_free_handle;
 static mutex_t mutex_env;
 static mutex_t mutex_pool;
 static mutex_t mutex_iconv;
@@ -386,6 +389,17 @@
 /*
  * protection for connection pooling
  */
+
+/* Protect the list of handles currently being freed. */
+void mutex_free_handle_entry( void )
+{
+    local_mutex_entry( &mutex_free_handle );
+}
+
+void mutex_free_handle_exit( void )
+{
+    local_mutex_exit( &mutex_free_handle );
+}
 
 void mutex_pool_entry( void )
 {
