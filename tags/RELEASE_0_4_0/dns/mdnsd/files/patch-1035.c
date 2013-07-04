--- 1035.c.orig	2009-06-07 15:11:59 -0400
+++ 1035.c	2009-06-07 15:15:07 -0400
@@ -241,7 +241,7 @@
     if(packet == 0 || m == 0) return;
 
     // keep all our mem in one (aligned) block for easy freeing
-    #define my(x,y) while(m->_len&7) m->_len++; (void*)x = (void*)(m->_packet + m->_len); m->_len += y;
+    #define my(x,y) while(m->_len&7) m->_len++; x = (void*)(m->_packet + m->_len); m->_len += y;
 
     // header stuff bit crap
     m->_buf = buf = packet;
