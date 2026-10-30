--- components/device_signals/core/browser/browser_utils.h.orig	2026-10-29 00:40:24 UTC
+++ components/device_signals/core/browser/browser_utils.h	2026-10-29 14:17:36 UTC
@@ -32,7 +32,7 @@
 #endif  // !BUILDFLAG(IS_ANDROID) && !BUILDFLAG(IS_IOS)
 
 #if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX) || \
-    BUILDFLAG(IS_CHROMEOS)
+    BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_BSD)
 // Returns the hostname of the current machine.
 std::vector<std::string> GetSystemDnsServers();
 
