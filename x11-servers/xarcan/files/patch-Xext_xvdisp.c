Backport X.Org November 10, 2026 security fixes from xorg-server 21.1.26.
https://gitlab.freedesktop.org/xorg/xserver/-/commit/71cba5e4
https://gitlab.freedesktop.org/xorg/xserver/-/commit/59bef993
https://gitlab.freedesktop.org/xorg/xserver/-/commit/bddd1a6a

--- Xext/xvdisp.c.orig	2023-12-18 20:29:59 UTC
+++ Xext/xvdisp.c
@@ -853,6 +853,9 @@
     height = stuff->height;
     size = (*pPort->pAdaptor->ddQueryImageAttributes) (pPort, pImage, &width,
                                                        &height, NULL, NULL);
+    if (size < 0)
+        return BadValue;
+
     size += sizeof(xvPutImageReq);
     size = bytes_to_int32(size);
 
@@ -919,7 +922,8 @@
     size_needed = (*pPort->pAdaptor->ddQueryImageAttributes) (pPort, pImage,
                                                               &width, &height,
                                                               NULL, NULL);
-    if ((size_needed + stuff->offset) > shmdesc->size)
+    if (size_needed < 0 || stuff->offset > shmdesc->size ||
+        (unsigned long) size_needed > shmdesc->size - stuff->offset)
         return BadAccess;
 
     if ((width < stuff->width) || (height < stuff->height))
@@ -1002,6 +1006,10 @@
     size = (*pPort->pAdaptor->ddQueryImageAttributes) (pPort, pImage,
                                                        &width, &height, offsets,
                                                        pitches);
+    if (size < 0) {
+        free(offsets);
+        return BadValue;
+    }
 
     rep = (xvQueryImageAttributesReply) {
         .type = X_Reply,
