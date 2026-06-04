--- cargo-crates/v8-147.4.0/third_party/partition_alloc/src/partition_alloc/stack/stack.cc.orig	2026-05-12 00:00:00 UTC
+++ cargo-crates/v8-147.4.0/third_party/partition_alloc/src/partition_alloc/stack/stack.cc
@@ -14,6 +14,9 @@
 #include <windows.h>
 #else
 #include <pthread.h>
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+#include <pthread_np.h>
+#endif
 #endif

 #if PA_BUILDFLAG(PA_LIBC_GLIBC)
@@ -54,7 +57,11 @@ void* GetStackTop() {

 void* GetStackTop() {
   pthread_attr_t attr;
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+  int error = pthread_attr_get_np(pthread_self(), &attr);
+#else
   int error = pthread_getattr_np(pthread_self(), &attr);
+#endif
   if (!error) {
     void* base;
     size_t size;
