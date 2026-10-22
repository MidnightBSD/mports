--- aclocal.m4.orig	2025-11-21 14:02:57 UTC
+++ aclocal.m4
@@ -559,7 +559,7 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
             SHLIB_SUFFIX=".so"
             LD_LIBRARY_PATH_VAR="LD_LIBRARY_PATH"
 	    ;;
-	*-freebsd*)
+	*-freebsd* | *-midnightbsd*)
 	    # NOTE: only FreeBSD 4+ is supported
 	    # FreeBSD 3.* and greater have ELF.
 	    SHLIB_CFLAGS="-fPIC"
