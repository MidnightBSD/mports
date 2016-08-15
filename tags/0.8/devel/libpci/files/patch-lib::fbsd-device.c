--- lib/fbsd-device.c.orig	2010-03-12 21:56:32 -0500
+++ lib/fbsd-device.c	2010-03-12 21:56:46 -0500
@@ -21,7 +21,7 @@
 #  endif
 #endif
 
-#if __FreeBSD_version < 430000 && !defined(__DragonFly__)
+#if __FreeBSD_version < 430000 && !defined(__DragonFly__) && !defined(__MidnightBSD__)
 #  include <pci/pcivar.h>
 #  include <pci/pci_ioctl.h>
 #else
