--- src/core/window-private.h.orig
+++ src/core/window-private.h
@@ -530,2 +530,2 @@
   /* Have this window been positioned? */
-  uint unconstrained_rect_valid : 1;
+  unsigned int unconstrained_rect_valid : 1;
