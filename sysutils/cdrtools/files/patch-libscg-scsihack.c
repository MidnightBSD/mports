--- libscg/scsihack.c.orig	2019-12-20 11:12:51.401213000 -0500
+++ libscg/scsihack.c	2019-12-20 11:13:18.682896000 -0500
@@ -139,7 +139,7 @@
 #endif	/* linux */
 
 #if	defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || \
-	defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__)
+	defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 #define	SCSI_IMPL		/* We have a SCSI implementation for *BSD */
 
 #include "scsi-bsd.c"
