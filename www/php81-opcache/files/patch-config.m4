--- config.m4.orig	2024-04-29 04:46:51 UTC
+++ config.m4
@@ -48,7 +48,7 @@ if test "$PHP_OPCACHE" != "no"; then
         DASM_FLAGS="-D X64APPLE=1 -D X64=1"
         DASM_ARCH="x86"
         ;;
-      *x86_64*|amd64-*-freebsd*)
+      *x86_64*|amd64-*-freebsd*|amd64-*-midnightbsd*)
         IR_TARGET=IR_TARGET_X64
         DASM_FLAGS="-D X64=1"
         DASM_ARCH="x86"
