--- srcm4/threadlib.m4.orig	2020-09-29 16:21:53 UTC
+++ srcm4/threadlib.m4
@@ -94,7 +94,7 @@ changequote([,])dnl
     # need special flags to disable these optimizations. For example, the
     # definition of 'errno' in <errno.h>.
     case "$host_os" in
-      aix* | freebsd*) CPPFLAGS="$CPPFLAGS -D_THREAD_SAFE" ;;
+      midnightbsd* | aix* | freebsd*) CPPFLAGS="$CPPFLAGS -D_THREAD_SAFE" ;;
       solaris*) CPPFLAGS="$CPPFLAGS -D_REENTRANT" ;;
     esac
   fi
