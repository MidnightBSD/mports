--- scsilib/libscg/scsihack.c.orig	2019-01-06 12:39:39.322472000 -0500
+++ scsilib/libscg/scsihack.c	2019-01-06 12:40:01.004378000 -0500
@@ -129,7 +129,7 @@
 
 #endif	/* linux */
 
-#if	defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
+#if	defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__MidnightBSD__)
 #define	SCSI_IMPL		/* We have a SCSI implementation for *BSD */
 
 #include "scsi-bsd.c"
