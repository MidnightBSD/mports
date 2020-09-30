--- srcm4/malloc.m4.orig	2020-09-29 16:21:21 UTC
+++ srcm4/malloc.m4
@@ -32,7 +32,7 @@ AC_DEFUN([_AC_FUNC_MALLOC_IF],
        [ac_cv_func_malloc_0_nonnull=no],
        [case "$host_os" in
           # Guess yes on platforms where we know the result.
-          *-gnu* | gnu* | *-musl* | freebsd* | netbsd* | openbsd* \
+          *-gnu* | gnu* | *-musl* | midnightbsd* | freebsd* | netbsd* | openbsd* \
           | hpux* | solaris* | cygwin* | mingw*)
             ac_cv_func_malloc_0_nonnull="guessing yes" ;;
           # If we don't know, assume the worst.
