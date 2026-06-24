--- tools/profiler/core/platform.cpp.orig
+++ tools/profiler/core/platform.cpp
@@ -7648,6 +7648,6 @@
     cpuId = ebx >> 24;
   }
 #  endif
-#else
+#elif !defined(__MidnightBSD__)
   cpuId = sched_getcpu();
 #endif
