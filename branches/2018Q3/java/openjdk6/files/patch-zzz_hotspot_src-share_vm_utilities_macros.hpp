--- hotspot/src/share/vm/utilities/macros.hpp.orig2	2016-09-03 19:14:09.604158508 -0400
+++ hotspot/src/share/vm/utilities/macros.hpp	2016-09-03 19:14:32.286158836 -0400
@@ -162,7 +162,7 @@
 #define NOT_WINDOWS(code) code
 #endif
 
-#if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__APPLE__)
+#if defined(__MidnightBSD__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__APPLE__)
 #define BSD_ONLY(code) code
 #define NOT_BSD(code)
 #else
