--- src/3rdparty/chromium/tools/licenses/licenses.py.orig	2025-11-06 16:28:09 UTC
+++ src/3rdparty/chromium/tools/licenses/licenses.py
@@ -808,6 +808,8 @@ def _GnBinary():
   exe = 'gn'
   if sys.platform.startswith('linux'):
     subdir = 'linux64'
+  elif sys.platform.startswith(('freebsd', 'midnightbsd')):
+    subdir = '../../../../.build/install/bin'
   elif sys.platform == 'darwin':
     subdir = 'mac'
