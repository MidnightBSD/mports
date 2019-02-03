--- hotspot/src/os/bsd/vm/os_bsd.cpp.orig2	2016-09-03 19:10:08.781158978 -0400
+++ hotspot/src/os/bsd/vm/os_bsd.cpp	2016-09-03 19:10:47.951158808 -0400
@@ -3771,7 +3771,7 @@
 #ifdef __OpenBSD__
   // OpenBSD pthread_setprio starves low priority threads
   return OS_OK;
-#elif defined(__FreeBSD__)
+#elif defined(__MidnightBSD__)
   int ret = pthread_setprio(thread->osthread()->pthread_id(), newpri);
 #elif defined(__APPLE__) || defined(__NetBSD__)
   struct sched_param sp;
@@ -3799,7 +3799,7 @@
   }
 
   errno = 0;
-#if defined(__OpenBSD__) || defined(__FreeBSD__)
+#if defined(__OpenBSD__) || defined(__MidnightBSD__)
   *priority_ptr = pthread_getprio(thread->osthread()->pthread_id());
 #elif defined(__APPLE__) || defined(__NetBSD__)
   int policy;
