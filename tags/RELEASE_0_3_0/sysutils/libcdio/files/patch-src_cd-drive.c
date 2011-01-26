
$FreeBSD: ports/sysutils/libcdio/files/patch-src_cd-drive.c,v 1.1 2007/03/12 14:19:39 mich Exp $

--- src/cd-drive.c.orig
+++ src/cd-drive.c
@@ -28,7 +28,7 @@
 #ifdef HAVE_SYS_TYPES_H
 #include <sys/types.h>
 #endif
-#include <getopt.h>
+#include "getopt.h"
 #include <cdio/cdio.h>
 #include <cdio/mmc.h>
 
