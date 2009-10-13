--- ../pr/src/misc/prnetdb.c.orig	2008-12-24 16:38:58 -0500
+++ ../pr/src/misc/prnetdb.c	2008-12-24 16:41:02 -0500
@@ -109,7 +109,7 @@
 #define _PR_HAVE_GETPROTO_R_INT
 #endif
 
-#if __FreeBSD_version >= 602000
+#if __MidnightBSD_version >= 3000
 #define _PR_HAVE_GETPROTO_R
 #define _PR_HAVE_5_ARG_GETPROTO_R
 #endif
