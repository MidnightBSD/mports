--- components/device_signals/core/common/linux/platform_utils_linux.cc.orig	2026-10-26 21:13:13 UTC
+++ components/device_signals/core/common/linux/platform_utils_linux.cc
@@ -3,12 +3,21 @@
 // found in the LICENSE file.
 
 #include "components/device_signals/core/common/platform_utils.h"
+
+#include "build/build_config.h"
 
 #if defined(USE_GIO)
 #include <gio/gio.h>
 #endif  // defined(USE_GIO)
 #include <sys/stat.h>
+#if !BUILDFLAG(IS_BSD)
 #include <sys/sysmacros.h>
+#else
+#include <ifaddrs.h>
+#include <net/if_dl.h>
+#include <sys/socket.h>
+#include <sys/types.h>
+#endif
 
 #include <algorithm>
 #include <optional>
@@ -128,6 +137,8 @@
 #if BUILDFLAG(IS_CHROMEOS)
   // ChromeOS user partitions are always encrypted via cryptohome.
   return SettingValue::ENABLED;
+#elif BUILDFLAG(IS_BSD)
+  return SettingValue::DISABLED;
 #else
   struct stat info;
   // First figure out the device identifier. Fail fast if this fails.
@@ -157,6 +168,29 @@
 
 std::vector<std::string> internal::GetMacAddressesImpl() {
   std::vector<std::string> result;
+#if BUILDFLAG(IS_BSD)
+  struct ifaddrs* ifa = nullptr;
+  if (getifaddrs(&ifa) != 0)
+    return result;
+
+  for (struct ifaddrs* interface = ifa; interface != nullptr;
+       interface = interface->ifa_next) {
+    if (interface->ifa_addr == nullptr ||
+        interface->ifa_addr->sa_family != AF_LINK) {
+      continue;
+    }
+    auto* sdl = reinterpret_cast<struct sockaddr_dl*>(interface->ifa_addr);
+    if (sdl->sdl_alen != 6)
+      continue;
+    const unsigned char* link_address =
+        reinterpret_cast<const unsigned char*>(LLADDR(sdl));
+    result.push_back(base::StringPrintf(
+        "%02x:%02x:%02x:%02x:%02x:%02x", link_address[0],
+        link_address[1], link_address[2], link_address[3], link_address[4],
+        link_address[5]));
+  }
+  freeifaddrs(ifa);
+#else
   base::DirReaderPosix reader("/sys/class/net");
   if (!reader.IsValid()) {
     return result;
@@ -181,6 +215,7 @@
                               &address);
     result.push_back(address);
   }
+#endif
   return result;
 }
 
