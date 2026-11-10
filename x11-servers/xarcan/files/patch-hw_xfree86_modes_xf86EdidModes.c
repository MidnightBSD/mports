Backport X.Org November 10, 2026 security fixes from xorg-server 21.1.26.
https://gitlab.freedesktop.org/xorg/xserver/-/commit/95cf222d

--- hw/xfree86/modes/xf86EdidModes.c.orig	2023-12-18 20:29:59 UTC
+++ hw/xfree86/modes/xf86EdidModes.c
@@ -1125,14 +1125,16 @@
     switch (det_mon->type) {
     case DS_RANGES:
         if (!p->have_hsync) {
-            if (!p->Monitor->nHsync)
-                xf86DrvMsg(scrnIndex, X_INFO,
-                           "Using EDID range info for horizontal sync\n");
-            p->Monitor->hsync[p->Monitor->nHsync].lo =
-                det_mon->section.ranges.min_h;
-            p->Monitor->hsync[p->Monitor->nHsync].hi =
-                det_mon->section.ranges.max_h;
-            p->Monitor->nHsync++;
+            if (p->Monitor->nHsync < MAX_HSYNC) {
+                if (!p->Monitor->nHsync)
+                    xf86DrvMsg(scrnIndex, X_INFO,
+                               "Using EDID range info for horizontal sync\n");
+                p->Monitor->hsync[p->Monitor->nHsync].lo =
+                    det_mon->section.ranges.min_h;
+                p->Monitor->hsync[p->Monitor->nHsync].hi =
+                    det_mon->section.ranges.max_h;
+                p->Monitor->nHsync++;
+            }
         }
         else {
             xf86DrvMsg(scrnIndex, X_INFO,
@@ -1140,14 +1142,16 @@
         }
 
         if (!p->have_vrefresh) {
-            if (!p->Monitor->nVrefresh)
-                xf86DrvMsg(scrnIndex, X_INFO,
-                           "Using EDID range info for vertical refresh\n");
-            p->Monitor->vrefresh[p->Monitor->nVrefresh].lo =
-                det_mon->section.ranges.min_v;
-            p->Monitor->vrefresh[p->Monitor->nVrefresh].hi =
-                det_mon->section.ranges.max_v;
-            p->Monitor->nVrefresh++;
+            if (p->Monitor->nVrefresh < MAX_VREFRESH) {
+                if (!p->Monitor->nVrefresh)
+                    xf86DrvMsg(scrnIndex, X_INFO,
+                               "Using EDID range info for vertical refresh\n");
+                p->Monitor->vrefresh[p->Monitor->nVrefresh].lo =
+                    det_mon->section.ranges.min_v;
+                p->Monitor->vrefresh[p->Monitor->nVrefresh].hi =
+                    det_mon->section.ranges.max_v;
+                p->Monitor->nVrefresh++;
+            }
         }
         else {
             xf86DrvMsg(scrnIndex, X_INFO,
