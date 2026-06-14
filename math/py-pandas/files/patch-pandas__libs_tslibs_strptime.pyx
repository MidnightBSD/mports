--- pandas/_libs/tslibs/strptime.pyx.orig	2026-05-25 01:30:00.760206000 -0400
+++ pandas/_libs/tslibs/strptime.pyx	2026-05-25 01:30:00.777831000 -0400
@@ -435,7 +435,7 @@
                     s = found_dict["f"]
                     # Pad to always return nanoseconds
                     s += "0" * (9 - len(s))
-                    us = long(s)
+                    us = int(s)
                     ns = us % 1000
                     us = us // 1000
                 elif parse_code == 11:
