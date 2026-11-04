--- gcc/config/freebsd-spec.h.orig	2025-08-08 02:18:46 UTC
+++ gcc/config/freebsd-spec.h
@@ -39,0 +40 @@
+	builtin_define_with_int_value ("__MidnightBSD__", FBSD_MAJOR);	\
