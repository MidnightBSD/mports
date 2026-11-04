--- chrome/browser/ui/window_sizer/window_sizer.cc.orig	2026-10-26 21:13:13 UTC
+++ chrome/browser/ui/window_sizer/window_sizer.cc	2026-10-29 14:15:23 UTC
@@ -225,7 +225,7 @@
       browser, window_bounds, show_state);
 }
 
-#if !BUILDFLAG(IS_LINUX)
+#if !BUILDFLAG(IS_LINUX) && !BUILDFLAG(IS_BSD)
 // Linux has its own implementation, see WindowSizerLinux.
 // static
 void WindowSizer::GetBrowserWindowBoundsAndShowState(
