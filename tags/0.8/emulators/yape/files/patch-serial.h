
$FreeBSD: ports/emulators/yape/files/patch-serial.h,v 1.1 2009/05/11 19:24:41 dhn Exp $

--- serial.h.orig
+++ serial.h
@@ -1,7 +1,7 @@
 #ifndef _SERIAL_H
 #define _SERIAL_H
 
-#include "SDL/SDL.h"
+#include "SDL.h"
 
 class CSerial {
 
