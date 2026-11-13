--- imageio/plugins/pillow_legacy.py.orig	2026-09-28 07:43:35 UTC
+++ imageio/plugins/pillow_legacy.py
@@ -822,6 +822,8 @@
             im = Image.frombytes(mode, image_shape, array_buffer)
         return im
     else:
+        if mode == "I;16" and arr.dtype.str == "<u2":
+            return Image.fromarray(arr)
         return Image.fromarray(arr, mode)
 
 
