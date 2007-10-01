
$FreeBSD: ports/emulators/bochs/files/patch-iodev::cdrom.cc,v 1.1 2002/03/11 23:21:06 sobomax Exp $

--- iodev/cdrom.cc	2002/03/11 23:15:19	1.1
+++ iodev/cdrom.cc	2002/03/11 23:15:57
@@ -37,6 +37,7 @@
 #define LOG_THIS /* no SMF tricks here, not needed */
 
 extern "C" {
+#include <arpa/inet.h>
 #include <errno.h>
 }
  
