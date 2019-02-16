--- coreconf/nsinstall/pathsub.c.bak	2018-10-15 23:55:45.000000000 -0400
+++ coreconf/nsinstall/pathsub.c	2019-02-15 20:17:46.856310000 -0500
@@ -5,7 +5,7 @@
 /*
 ** Pathname subroutines.
 */
-#if defined(FREEBSD) || defined(BSDI) || defined(DARWIN)
+#if defined(FREEBSD) || defined(BSDI) || defined(DARWIN) || defined(MIDNIGHTBSD)
 #include <sys/types.h>
 #endif /* FREEBSD */
 #include <dirent.h>
