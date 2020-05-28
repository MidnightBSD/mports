--- media/libnestegg/src/align.h.orig	2016-05-12 13:09:57.000000000 -0400
+++ media/libnestegg/src/align.h	2020-05-28 11:07:17.823057000 -0400
@@ -24,6 +24,7 @@
 
 #else
 
+#if !defined(__MidnightBSD__)
 /*
  *	a type with the most strict alignment requirements
  */
@@ -40,6 +41,7 @@
 };
 
 typedef union max_align max_align_t;
+#endif
 
 #endif
 
