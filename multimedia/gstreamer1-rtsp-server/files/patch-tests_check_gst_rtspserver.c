--- tests/check/gst/rtspserver.c.orig
+++ tests/check/gst/rtspserver.c
@@ -2078,5 +2078,5 @@ test_shared (gpointer (thread_func) (gpo
   g_mutex_lock (&lock2);
   thread2 = g_thread_new ("thread2", thread_func, &lock2);
   g_mutex_unlock (&lock2);
-  g_mutex_clear (&lock2);
   g_thread_join (thread2);
+  g_mutex_clear (&lock2);
@@ -2084,6 +2084,6 @@ test_shared (gpointer (thread_func) (gpo
   /* Do it again. */
   g_mutex_lock (&lock3);
   thread3 = g_thread_new ("thread3", thread_func, &lock3);
   g_mutex_unlock (&lock3);
-  g_mutex_clear (&lock3);
   g_thread_join (thread3);
+  g_mutex_clear (&lock3);
@@ -2091,4 +2091,4 @@ test_shared (gpointer (thread_func) (gpo
   /* Disconnect the last client. This will clean up the media. */
   g_mutex_unlock (&lock1);
-  g_mutex_clear (&lock1);
   g_thread_join (thread1);
+  g_mutex_clear (&lock1);
@@ -2098,5 +2098,5 @@ test_shared (gpointer (thread_func) (gpo
   g_mutex_lock (&lock4);
   thread4 = g_thread_new ("thread4", thread_func, &lock4);
   g_mutex_unlock (&lock4);
-  g_mutex_clear (&lock4);
   g_thread_join (thread4);
+  g_mutex_clear (&lock4);
