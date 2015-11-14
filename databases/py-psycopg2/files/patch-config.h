--- psycopg/config.h.orig	2015-11-13 19:16:42.574838932 -0500
+++ psycopg/config.h	2015-11-13 19:16:55.001643787 -0500
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
 /* postgresql < 7.4 does not have PQfreemem */
 #ifndef HAVE_PQFREEMEM
 #define PQfreemem free
