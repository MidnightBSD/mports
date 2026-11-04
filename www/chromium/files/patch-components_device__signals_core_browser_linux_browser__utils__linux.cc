--- components/device_signals/core/browser/linux/browser_utils_linux.cc.orig	2026-10-26 21:13:13 UTC
+++ components/device_signals/core/browser/linux/browser_utils_linux.cc	2026-10-29 14:17:36 UTC
@@ -55,6 +55,9 @@
     return SettingValue::UNKNOWN;
   }
   return SettingValue::ENABLED;
+#elif BUILDFLAG(IS_BSD)
+  // UFW configuration does not describe the BSD firewall state.
+  return SettingValue::UNKNOWN;
 #else
   base::FilePath path(*GetUfwConfigPath());
   std::string file_content;
