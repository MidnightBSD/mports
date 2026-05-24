--- pandas/_libs/tslibs/strptime.pyx.orig
+++ pandas/_libs/tslibs/strptime.pyx
@@ -435,7 +435,7 @@ cdef _parse_with_format(
                 # Pad to always return nanoseconds
                 s += "0" * (9 - len(s))
-                us = long(s)
+                us = int(s)
             else:
                 us = 0
