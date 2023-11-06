--- Samba/source/winexe/service.c.orig	2008-07-30 19:44:55 UTC
+++ Samba/source/winexe/service.c
@@ -15,7 +15,7 @@
 #define SERVICE_DEMAND_START (0x00000003)
 #define SERVICE_ERROR_NORMAL (0x00000001)
 #define SERVICE_CONTROL_STOP (0x00000001)
-#define NT_STATUS_SERVICE_DOES_NOT_EXIST NT_STATUS(0xc0000424)
+#define NT_STATUS_SERVICE_DOES_NOT_EXIST NT_STATUS(0x00000424)
 #include "system/filesys.h"
 #include "libcli/libcli.h"
 #include "libcli/smb_composite/smb_composite.h"
