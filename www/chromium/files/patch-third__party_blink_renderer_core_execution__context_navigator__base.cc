--- third_party/blink/renderer/core/execution_context/navigator_base.cc.orig	2026-10-29 00:40:24 UTC
+++ third_party/blink/renderer/core/execution_context/navigator_base.cc	2026-10-29 08:10:38 UTC
@@ -27,7 +27,8 @@
 
 namespace {
 
-#if BUILDFLAG(IS_ANDROID) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)
+#if BUILDFLAG(IS_ANDROID) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || \
+    BUILDFLAG(IS_BSD)
 constexpr char kLinuxX86_64[] = "Linux x86_64";
 #endif
 
@@ -47,7 +48,7 @@
   return "Win32";
 #elif BUILDFLAG(IS_FUCHSIA)
   return "";
-#elif BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)
+#elif BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_BSD)
   return kLinuxX86_64;
 #elif BUILDFLAG(IS_IOS)
   return "iPhone";
