--- gcc/config/freebsd-spec.h.orig	2024-06-20 07:46:11 UTC
+++ gcc/config/freebsd-spec.h
@@ -39,0 +40 @@
+	builtin_define_with_int_value ("__MidnightBSD__", FBSD_MAJOR);	\
