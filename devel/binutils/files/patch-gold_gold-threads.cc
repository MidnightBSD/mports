--- gold/gold-threads.cc.orig	2019-10-09 00:20:48.865757000 -0400
+++ gold/gold-threads.cc	2019-10-09 00:20:54.825433000 -0400
@@ -285,8 +283,8 @@
 {
  public:
   Once_initialize()
-    : once_(PTHREAD_ONCE_INIT)
-  { }
+    : once_()
+  { { PTHREAD_NEEDS_INIT, NULL; }  }
 
   // Return a pointer to the pthread_once_t variable.
   pthread_once_t*
