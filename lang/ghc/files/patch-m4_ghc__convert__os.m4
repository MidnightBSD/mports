--- m4/ghc_convert_os.m4.orig	2026-03-26 05:06:13 UTC
+++ m4/ghc_convert_os.m4
@@ -41,9 +41,10 @@ AC_DEFUN([GHC_CONVERT_OS],[
       solaris2*)
         $3="solaris2"
         ;;
-      freebsd*) # like i686-gentoo-freebsd7
+      freebsd*|midnightbsd*) # like i686-gentoo-freebsd7
                 #      i686-gentoo-freebsd8
                 #      i686-gentoo-freebsd8.2
+                # MidnightBSD is FreeBSD-derived (amd64-unknown-midnightbsd4.0)
         $3="freebsd"
         ;;
       nto-qnx*)
