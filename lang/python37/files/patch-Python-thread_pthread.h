--- Python/thread_pthread.h.orig	2020-06-27 17:23:59.167393000 -0400
+++ Python/thread_pthread.h	2020-06-27 17:24:44.547507000 -0400
@@ -30,7 +30,7 @@
 #undef  THREAD_STACK_SIZE
 #define THREAD_STACK_SIZE       0x500000
 #endif
-#if defined(__FreeBSD__) && defined(THREAD_STACK_SIZE) && THREAD_STACK_SIZE == 0
+#if (defined(__MidnightBSD__) || defined(__FreeBSD__)) && defined(THREAD_STACK_SIZE) && THREAD_STACK_SIZE == 0
 #undef  THREAD_STACK_SIZE
 #define THREAD_STACK_SIZE       0x400000
 #endif
