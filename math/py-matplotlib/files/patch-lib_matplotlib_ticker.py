--- lib/matplotlib/ticker.py.orig
+++ lib/matplotlib/ticker.py
@@ -836,9 +836,12 @@
                            if abs_max // 10 ** oom - abs_min // 10 ** oom > 1)
         # Only use offset if it saves at least _offset_threshold digits.
         n = self._offset_threshold - 1
-        self.offset = (sign * (abs_max // 10 ** oom) * 10 ** oom
-                       if abs_max // 10 ** oom >= 10**n
-                       else 0)
+        if abs_max // 10 ** oom >= 10**n:
+            offset = (abs_max // 10 ** oom) * 10 ** oom
+            # Normalize floating-point noise at the selected decimal precision.
+            self.offset = sign * round(float(offset), int(-oom))
+        else:
+            self.offset = 0

     def _set_order_of_magnitude(self):
         # if scientific notation is to be used, find the appropriate exponent
