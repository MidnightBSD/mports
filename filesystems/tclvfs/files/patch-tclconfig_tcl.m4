--- tclconfig/tcl.m4.orig	2008-05-03 15:55:52 UTC
+++ tclconfig/tcl.m4
@@ -1592 +1592 @@ AC_DEFUN([TEA_CONFIG_CFLAGS], [
-	FreeBSD-*)
+	MidnightBSD-*|FreeBSD-*)
@@ -2000 +2000 @@ dnl # preprocessing tests use only CPPFLAGS.
-		NetBSD-*|FreeBSD-*)
+		NetBSD-*|MidnightBSD-*|FreeBSD-*)
