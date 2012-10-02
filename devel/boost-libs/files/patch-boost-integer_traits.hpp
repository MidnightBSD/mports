--- boost/integer_traits.hpp.orig	2012-09-16 17:53:54 +0000
+++ boost/integer_traits.hpp	2012-09-16 17:54:11 +0000
@@ -110,7 +110,7 @@
     || (defined __APPLE__)\
     || (defined(__OpenBSD__) && defined(__GNUC__))\
     || (defined(__NetBSD__) && defined(__GNUC__))\
-    || (defined(__FreeBSD__) && defined(__GNUC__))\
+    || (defined(__MidnightBSD__) && defined(__GNUC__))\
     || (defined(__DragonFly__) && defined(__GNUC__))\
     || (defined(__hpux) && defined(__GNUC__) && (__GNUC__ == 3) && !defined(__SGI_STL_PORT))
     // No WCHAR_MIN and WCHAR_MAX, wchar_t has the same range as int.
