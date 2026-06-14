--- make/autoconf/platform.m4.orig
+++ make/autoconf/platform.m4
@@ -211,7 +211,7 @@
       VAR_OS=bsd
       VAR_OS_TYPE=unix
       case "$1" in
-        *freebsd*)
+        *freebsd*|*midnightbsd*)
           VAR_OS_ENV=bsd.freebsd ;;
         *openbsd*)
           VAR_OS_ENV=bsd.openbsd ;;
