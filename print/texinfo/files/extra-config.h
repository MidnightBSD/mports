--- config.h.orig	2022-09-11 15:02:06.972976000 -0400
+++ config.h	2022-09-11 15:02:27.873395000 -0400
@@ -1329,7 +1329,7 @@
    It defines a macro __GNUC_GNU_INLINE__ to indicate this situation.
  */
 #if (((defined __APPLE__ && defined __MACH__) \
-      || defined __DragonFly__ || defined __FreeBSD__) \
+      || defined __DragonFly__ || defined __FreeBSD__ || defined(__MidnightBSD__)) \
      && (defined __header_inline \
          ? (defined __cplusplus && defined __GNUC_STDC_INLINE__ \
             && ! defined __clang__) \
