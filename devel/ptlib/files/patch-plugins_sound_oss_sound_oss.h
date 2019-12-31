--- plugins/sound_oss/sound_oss.h.orig	2019-10-10 21:31:25.680778000 -0400
+++ plugins/sound_oss/sound_oss.h	2019-10-10 21:31:44.563960000 -0400
@@ -15,13 +15,7 @@
 #include <sys/soundcard.h>
 #endif
 
-#ifdef P_FREEBSD
-#if P_FREEBSD >= 500000
 #include <sys/soundcard.h>
-#else
-#include <machine/soundcard.h>
-#endif
-#endif
 
 #if defined(P_OPENBSD) || defined(P_NETBSD)
 #include <soundcard.h>
