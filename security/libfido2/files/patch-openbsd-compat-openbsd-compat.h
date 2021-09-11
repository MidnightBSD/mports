--- openbsd-compat/openbsd-compat.h.orig	2021-09-11 11:36:07.868375000 -0400
+++ openbsd-compat/openbsd-compat.h	2021-09-11 11:36:29.517490000 -0400
@@ -37,7 +37,7 @@
 uint64_t htole64(uint64_t);
 #endif /* _WIN32 && !HAVE_ENDIAN_H */
 
-#if defined(__FreeBSD__) && !defined(HAVE_ENDIAN_H)
+#if (defined(__FreeBSD__) || defined(__MidnightBSD__)) && !defined(HAVE_ENDIAN_H)
 #include <sys/endian.h>
 #endif
 
