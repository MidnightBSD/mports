--- nokap/_browser.py.orig
+++ nokap/_browser.py
@@ -5,6 +5,7 @@
 import re
 import shutil
 import subprocess
+import sys
 import time
 
 from ._errors import ChromeNotFoundError, ChromeStartError
@@ -54,6 +55,8 @@
             "chromium",
             "microsoft-edge",
         ]
+        if sys.platform.startswith(("freebsd", "midnightbsd")):
+            names.insert(0, "chrome")
         for name in names:
             path = shutil.which(name)
             if path:
