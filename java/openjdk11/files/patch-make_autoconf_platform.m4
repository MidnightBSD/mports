--- make/autoconf/platform.m4.orig	2025-12-24 00:32:09.346513000 -0500
+++ make/autoconf/platform.m4	2025-12-24 00:32:27.897229000 -0500
@@ -204,7 +204,7 @@
       VAR_OS=bsd
       VAR_OS_TYPE=unix
       case "$1" in
-        *freebsd*)
+        *freebsd*|*midnightbsd*)
           VAR_OS_ENV=bsd.freebsd ;;
         *openbsd*)
           VAR_OS_ENV=bsd.openbsd ;;
