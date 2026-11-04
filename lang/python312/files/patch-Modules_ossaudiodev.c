--- Modules/ossaudiodev.c.orig	2022-04-18 10:44:02.627033000 -0400
+++ Modules/ossaudiodev.c	2022-04-18 10:46:47.719713000 -0400
@@ -41,7 +41,7 @@
 typedef unsigned long uint32_t;
 #endif
 
-#elif defined(__FreeBSD__)
+#elif defined(__FreeBSD__) || defined(__MidnightBSD__)
 
 # ifndef SNDCTL_DSP_CHANNELS
 #  define SNDCTL_DSP_CHANNELS SOUND_PCM_WRITE_CHANNELS
