Backport X.Org November 10, 2026 security fixes from xorg-server 21.1.26.
https://gitlab.freedesktop.org/xorg/xserver/-/commit/43b4064a

--- Xext/xtest.c.orig	2023-12-18 20:29:59 UTC
+++ Xext/xtest.c
@@ -257,6 +257,12 @@
                 client->errorValue = dv->first_valuator;
                 return BadValue;
             }
+            if (!dv->num_valuators || dv->num_valuators > 6 ||
+                base + dv->num_valuators > dev->valuator->numAxes ||
+                base + dv->num_valuators > MAX_VALUATORS) {
+                client->errorValue = dv->num_valuators;
+                return BadValue;
+            }
             switch (dv->num_valuators) {
             case 6:
                 valuators[base + 5] = dv->valuator5;
@@ -278,11 +284,6 @@
 
             base += dv->num_valuators;
             numValuators += dv->num_valuators;
-
-            if (firstValuator + numValuators > dev->valuator->numAxes) {
-                client->errorValue = dv->num_valuators;
-                return BadValue;
-            }
         }
         type = type - XI_DeviceKeyPress + KeyPress;
 
