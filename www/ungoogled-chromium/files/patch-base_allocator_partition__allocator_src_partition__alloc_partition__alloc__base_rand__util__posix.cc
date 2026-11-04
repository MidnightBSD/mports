--- base/allocator/partition_allocator/src/partition_alloc/partition_alloc_base/rand_util_posix.cc.orig	2026-10-26 21:13:14 UTC
+++ base/allocator/partition_allocator/src/partition_alloc/partition_alloc_base/rand_util_posix.cc
@@ -108,6 +108,11 @@
     PA_MSAN_UNPOISON(output, output_length);
     return;
   }
+#elif PA_BUILDFLAG(IS_BSD)
+  if (getentropy(output, output_length) == 0) {
+    PA_MSAN_UNPOISON(output, output_length);
+    return;
+  }
 #endif  // PA_BUILDFLAG(IS_LINUX) || PA_BUILDFLAG(IS_CHROMEOS)
   // If getrandom(2) above returned with an error and the /dev/urandom fallback
   // took place on Linux/ChromeOS bots, they would fail with a CHECK in
