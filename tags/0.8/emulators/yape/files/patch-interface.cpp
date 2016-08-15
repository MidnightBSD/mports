
$FreeBSD: ports/emulators/yape/files/patch-interface.cpp,v 1.2 2005/10/13 14:44:05 mnag Exp $

--- interface.cpp.orig
+++ interface.cpp
@@ -10,7 +10,7 @@
 	(c) 2000, 2001 Attila Grósz
 */
 
-#include "SDL/SDL.h"
+#include "SDL.h"
 #include "tedmem.h"
 #include "interface.h"
 #include "archdep.h"
