
$FreeBSD: ports/emulators/yape/files/patch-main.h,v 1.2 2005/10/13 14:44:05 mnag Exp $

--- main.h.orig
+++ main.h
@@ -17,7 +17,7 @@
 #include <string.h>
 #include <ctype.h>
 #include <math.h>
-#include "SDL/SDL.h"
+#include "SDL.h"
 
 #include "keyboard.h"
 #include "cpu.h"
