--- tools/profiler/core/platform.cpp.orig	2025-06-01 18:00:00 UTC
+++ tools/profiler/core/platform.cpp
@@ -7779,7 +7779,7 @@ void profiler_mark_thread_awake() {
     cpuId = ebx >> 24;
   }
 #    endif
-#  else
+#  elif !defined(__MidnightBSD__)
   cpuId = sched_getcpu();
 #  endif
 #endif
