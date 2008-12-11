--- ./src/xine-engine/buffer.h.orig	Wed Dec 10 16:24:37 2008
+++ ./src/xine-engine/buffer.h	Wed Dec 10 16:24:44 2008
@@ -676,7 +676,7 @@
 /* convert xine_waveformatex struct from little endian */
 void _x_waveformatex_le2me( xine_waveformatex *wavex ) XINE_PROTECTED;
 
-static inline _x_is_fourcc(void *ptr, void *tag) {
+static inline int _x_is_fourcc(void *ptr, void *tag) {
   return memcmp(ptr, tag, 4) == 0;
 }
 
