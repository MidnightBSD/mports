Probe real X11/Wayland availability on BSD too, so headless GUI requests
raise an import error instead of entering GTK without a display.

--- src/_c_internal_utils.cpp.orig
+++ src/_c_internal_utils.cpp
@@ -17,7 +17,7 @@
 #endif
 #endif
 #include <pybind11/pybind11.h>
-#ifdef __linux__
+#if defined(__linux__) || defined(__FreeBSD__) || defined(__MidnightBSD__)
 #include <dlfcn.h>
 #endif
 #ifdef _WIN32
@@ -35,7 +35,7 @@
 static bool
 mpl_xdisplay_is_valid(void)
 {
-#ifdef __linux__
+#if defined(__linux__) || defined(__FreeBSD__) || defined(__MidnightBSD__)
     void* libX11;
     // The getenv check is redundant but helps performance as it is much faster
     // than dlopen().
@@ -66,7 +66,7 @@
 static bool
 mpl_display_is_valid(void)
 {
-#ifdef __linux__
+#if defined(__linux__) || defined(__FreeBSD__) || defined(__MidnightBSD__)
     if (mpl_xdisplay_is_valid()) {
         return true;
     }
