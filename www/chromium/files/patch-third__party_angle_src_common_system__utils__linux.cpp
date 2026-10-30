--- third_party/angle/src/common/system_utils_linux.cpp.orig	2026-10-26 21:13:13 UTC
+++ third_party/angle/src/common/system_utils_linux.cpp	2026-10-29 04:11:31 UTC
@@ -16,10 +16,15 @@
 #include <sys/types.h>
 #include <unistd.h>
 
+#if ANGLE_PLATFORM_OPENBSD
+#include <pthread_np.h>
+#endif
+
 #include <array>
 
 namespace angle
 {
+#if ANGLE_PLATFORM_LINUX
 std::string GetExecutablePath()
 {
     // We cannot use lstat to get the size of /proc/self/exe as it always returns 0
@@ -35,6 +40,7 @@
     ANGLE_UNSAFE_TODO(path[result]) = '\0';
     return path;
 }
+#endif
 
 std::string GetExecutableDirectory()
 {
@@ -48,17 +54,23 @@
     return "so";
 }
 
+#if ANGLE_PLATFORM_BSD
+constexpr clockid_t kMonotonicClock = CLOCK_MONOTONIC;
+#else
+constexpr clockid_t kMonotonicClock = CLOCK_MONOTONIC_RAW;
+#endif
+
 double GetCurrentSystemTime()
 {
     struct timespec currentTime;
-    clock_gettime(CLOCK_MONOTONIC_RAW, &currentTime);
+    clock_gettime(kMonotonicClock, &currentTime);
     return currentTime.tv_sec + currentTime.tv_nsec * 1e-9;
 }
 
 uint64_t GetCurrentSystemTimeNs()
 {
     struct timespec currentTime;
-    clock_gettime(CLOCK_MONOTONIC_RAW, &currentTime);
+    clock_gettime(kMonotonicClock, &currentTime);
     return static_cast<uint64_t>(currentTime.tv_sec) * 1000'000'000 + currentTime.tv_nsec;
 }
 
@@ -67,6 +79,10 @@
     // There's a 15-character (16 including '\0') limit.  If the name is too big (and ERANGE is
     // returned), name will be ignored.
     ASSERT(strlen(name) < 16);
+#if ANGLE_PLATFORM_OPENBSD
+    pthread_set_name_np(pthread_self(), name);
+#else
     pthread_setname_np(pthread_self(), name);
+#endif
 }
 }  // namespace angle
