Backport X.Org November 10, 2026 security fixes from xorg-server 21.1.26.
https://gitlab.freedesktop.org/xorg/xserver/-/commit/1a84c543

--- glamor/glamor_xv.c.orig	2023-12-18 20:29:59 UTC
+++ glamor/glamor_xv.c
@@ -259,7 +259,7 @@
                                  unsigned short *w, unsigned short *h,
                                  int *pitches, int *offsets)
 {
-    int size = 0, tmp;
+    int64_t size = 0, tmp;
 
     if (offsets)
         offsets[0] = 0;
@@ -272,6 +272,8 @@
         if (pitches)
             pitches[0] = size;
         size *= *h;
+        if (size > INT_MAX)
+            return -1;
         if (offsets)
             offsets[1] = size;
         tmp = ALIGN(*w >> 1, 4);
@@ -279,6 +281,8 @@
             pitches[1] = pitches[2] = tmp;
         tmp *= (*h >> 1);
         size += tmp;
+        if (size > INT_MAX)
+            return -1;
         if (offsets)
             offsets[2] = size;
         size += tmp;
@@ -290,6 +294,8 @@
         if (pitches)
             pitches[0] = size;
         size *= *h;
+        if (size > INT_MAX)
+            return -1;
         if (offsets)
             offsets[1] = offsets[2] = size;
         tmp = ALIGN(*w, 4);
@@ -299,6 +305,8 @@
         size += tmp;
         break;
     }
+    if (size > INT_MAX)
+        return -1;
     return size;
 }
 
