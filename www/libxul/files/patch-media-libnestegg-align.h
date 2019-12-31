--- media/libnestegg/src/align.h.orig	2019-10-02 10:57:13.955624000 -0400
+++ media/libnestegg/src/align.h	2019-10-02 11:01:33.187412000 -0400
@@ -39,7 +39,9 @@
 	void (*q)(void);
 };
 
+#if !defined(max_align_t)
 typedef union max_align max_align_t;
+#endif
 
 #endif
 
