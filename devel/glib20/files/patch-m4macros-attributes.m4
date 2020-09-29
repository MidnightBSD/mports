--- m4macros/attributes.m4.orig	2020-09-28 17:14:51.934847000 -0400
+++ m4macros/attributes.m4	2020-09-28 17:15:08.445855000 -0400
@@ -86,7 +86,7 @@
      dnl FreeBSD (et al.) does not complete linking for shared objects when pthreads
      dnl are requested, as different implementations are present; to avoid problems
      dnl use -Wl,-z,defs only for those platform not behaving this way.
-     *-freebsd* | *-openbsd*) ;;
+     *-freebsd* | *-openbsd* | *-midnightbsd*) ;;
      *)
         dnl First of all check for the --no-undefined variant of GNU ld. This allows
         dnl for a much more readable commandline, so that people can understand what
