--- mkisofs/defaults.h.orig	2019-12-20 11:07:37.728382000 -0500
+++ mkisofs/defaults.h	2019-12-20 11:08:16.528255000 -0500
@@ -71,6 +71,10 @@
 #define	SYSTEM_ID_DEFAULT	"FreeBSD"
 #endif
 
+#if defined(__MidnightBSD__) || defined(__MidnightBSD_kernel__)
+#define	SYSTEM_ID_DEFAULT	"MidnightBSD"
+#endif
+
 #ifdef __DragonFly__
 #define	SYSTEM_ID_DEFAULT	"DragonFly"
 #endif
