-- tensorpipe defines getBootIDInternal() only for __APPLE__ and __linux__,
-- so it is undeclared on MidnightBSD and system.cc fails to compile when
-- USE_DISTRIBUTED is enabled. FreeBSD and MidnightBSD have no per-boot
-- UUID, so combine the stable kern.hostuuid with kern.boottime to get an
-- identifier unique to this boot, which is what tensorpipe uses the boot
-- ID for when deciding shared-memory channel eligibility.
--- third_party/tensorpipe/tensorpipe/common/system.cc.orig	2026-07-08 17:44:27 UTC
+++ third_party/tensorpipe/tensorpipe/common/system.cc
@@ -20,6 +20,11 @@
 #include <IOKit/IOKitLib.h>
 #endif
 
+#if defined(__FreeBSD__)
+#include <sys/sysctl.h>
+#include <sys/time.h>
+#endif
+
 #include <array>
 #include <cstring>
 #include <fstream>
@@ -67,6 +72,26 @@
   return std::string(buf.data());
 }
 
+#elif defined(__FreeBSD__)
+optional<std::string> getBootIDInternal() {
+  // FreeBSD and MidnightBSD have no per-boot UUID, so combine the stable
+  // host UUID with the boot time to get an ID unique to this boot.
+  std::array<char, 64> uuid;
+  size_t uuidLen = uuid.size();
+  if (::sysctlbyname("kern.hostuuid", uuid.data(), &uuidLen, nullptr, 0) != 0) {
+    return nullopt;
+  }
+  struct timeval boottime;
+  size_t boottimeLen = sizeof(boottime);
+  if (::sysctlbyname("kern.boottime", &boottime, &boottimeLen, nullptr, 0) !=
+      0) {
+    return nullopt;
+  }
+  std::ostringstream oss;
+  oss << std::string(uuid.data()) << "-" << boottime.tv_sec;
+  return oss.str();
+}
+
 #elif defined(__linux__)
 optional<std::string> getBootIDInternal() {
   std::ifstream f{"/proc/sys/kernel/random/boot_id"};
