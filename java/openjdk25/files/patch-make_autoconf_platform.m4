--- make/autoconf/platform.m4.orig
+++ make/autoconf/platform.m4
@@ -40,7 +40,7 @@
       VAR_CPU_BITS=32
       VAR_CPU_ENDIAN=little
       ;;
-    x86_64)
+    x86_64 | amd64)
       VAR_CPU=x86_64
       VAR_CPU_ARCH=x86
       VAR_CPU_BITS=64
@@ -211,7 +211,7 @@
       VAR_OS=bsd
       VAR_OS_TYPE=unix
       case "$1" in
-        *freebsd*)
+        *freebsd*|*midnightbsd*)
           VAR_OS_ENV=bsd.freebsd ;;
         *openbsd*)
           VAR_OS_ENV=bsd.openbsd ;;
