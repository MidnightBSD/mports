--- chrome/browser/ui/browser_window/internal/create_browser_window_non_android.cc.orig	2026-10-26 21:13:13 UTC
+++ chrome/browser/ui/browser_window/internal/create_browser_window_non_android.cc	2026-10-29 12:53:50 UTC
@@ -46,7 +46,7 @@
 #if BUILDFLAG(IS_CHROMEOS)
   clone.display_id = display_id;
 #endif
-#if BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   clone.startup_id = startup_id;
 #endif
 #if BUILDFLAG(IS_OZONE)
