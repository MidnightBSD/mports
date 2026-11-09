--- test/auto.py
+++ test/auto.py
@@ -10,6 +10,7 @@
 import re
 import shutil
 import subprocess
+import sys
 import tempfile
 import unittest
 
@@ -1050,7 +1051,7 @@
         env.pop("PYTHONDONTWRITEBYTECODE", "")
         os.chdir(self.src)
         s = subprocess.Popen(
-            ["/proc/self/exe", "setup.py"] + args,
+            [sys.executable, "setup.py"] + args,
             env=env,
             stdout=subprocess.PIPE,
             stderr=subprocess.PIPE,
