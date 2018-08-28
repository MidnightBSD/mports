--- psycopg/config.h.orig	2015-06-15 05:48:36.000000000 -0400
+++ psycopg/config.h	2015-11-13 19:18:25.412200192 -0500
@@ -141,17 +141,6 @@
 #endif
 #endif
 
-#if (defined(__FreeBSD__) && __FreeBSD_version < 503000) \
-    || (defined(_WIN32) && !defined(__GNUC__)) \
-    || (defined(sun) || defined(__sun__)) \
-        && (defined(__SunOS_5_8) || defined(__SunOS_5_9))
-/* what's this, we have no round function either? */
-static double round(double num)
-{
-  return (num >= 0) ? floor(num + 0.5) : ceil(num - 0.5);
-}
-#endif
-
 /* resolve missing isinf() function for Solaris */
 #if defined (__SVR4) && defined (__sun)
 #include <ieeefp.h>
