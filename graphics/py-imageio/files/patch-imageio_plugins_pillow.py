--- imageio/plugins/pillow.py.orig	2026-09-28 07:43:35 UTC
+++ imageio/plugins/pillow.py
@@ -442,7 +442,7 @@
             ndimage = ndimage[None, ...]
 
         for frame in ndimage:
-            if mode is None:
+            if mode is None or (mode == "I;16" and frame.dtype.str == "<u2"):
                 pil_frame = Image.fromarray(frame)
             else:
                 pil_frame = Image.fromarray(frame, mode=mode)
