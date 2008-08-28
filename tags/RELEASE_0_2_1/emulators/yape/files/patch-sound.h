
$FreeBSD: ports/emulators/yape/files/patch-sound.h,v 1.2 2005/10/13 14:44:05 mnag Exp $

--- sound.h.orig
+++ sound.h
@@ -1,7 +1,7 @@
 #ifndef _SOUND_H
 #define _SOUND_H
 
-#include "SDL/SDL.h"
+#include "SDL.h"
 
 
 class MEM;
