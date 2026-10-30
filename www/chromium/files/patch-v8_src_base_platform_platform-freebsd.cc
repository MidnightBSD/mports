--- v8/src/base/platform/platform-freebsd.cc.orig	2026-10-26 21:13:13 UTC
+++ v8/src/base/platform/platform-freebsd.cc	2026-10-29 06:14:35 UTC
@@ -43,14 +43,10 @@
   return new PosixDefaultTimezoneCache();
 }
 
-static unsigned StringToLong(char* buffer) {
-  return static_cast<unsigned>(strtol(buffer, nullptr, 16));
-}
-
 std::vector<OS::SharedLibraryAddress> OS::GetSharedLibraryAddresses() {
   std::vector<SharedLibraryAddress> result;
   int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_VMMAP, getpid()};
-  size_t miblen = sizeof(mib) / sizeof(mib[0]);
+  unsigned int miblen = sizeof(mib) / sizeof(mib[0]);
   size_t buffer_size;
   if (sysctl(mib, miblen, nullptr, &buffer_size, nullptr, 0) == 0) {
     // Overallocate the buffer by 1/3 to account for concurrent
@@ -82,8 +78,13 @@
             lib_name = std::string(path);
           }
           result.push_back(SharedLibraryAddress(
+#if defined(__i386__) || defined(OS_FREEBSD)
+              lib_name, static_cast<uintptr_t>(map->kve_start),
+              static_cast<uintptr_t>(map->kve_end)));
+#else
               lib_name, reinterpret_cast<uintptr_t>(map->kve_start),
               reinterpret_cast<uintptr_t>(map->kve_end)));
+#endif
         }
 
         start += ssize;
@@ -121,5 +122,22 @@
   return nullptr;
 }
 
+// static
+Stack::StackSlot Stack::ObtainCurrentThreadStackReservedLimit() {
+  pthread_attr_t attr;
+  if (pthread_attr_init(&attr) != 0) return nullptr;
+  int error = pthread_attr_get_np(pthread_self(), &attr);
+  if (error) {
+    pthread_attr_destroy(&attr);
+    return nullptr;
+  }
+  void* base;
+  size_t size;
+  error = pthread_attr_getstack(&attr, &base, &size);
+  pthread_attr_destroy(&attr);
+  CHECK(!error);
+  return base;
+}
+
 }  // namespace base
 }  // namespace v8
