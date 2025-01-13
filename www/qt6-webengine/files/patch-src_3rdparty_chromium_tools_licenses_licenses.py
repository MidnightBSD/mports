--- src/3rdparty/chromium/tools/licenses/licenses.py.orig	2024-02-09 19:23:21.000000000 -0500
+++ src/3rdparty/chromium/tools/licenses/licenses.py	2025-01-13 14:51:36.130928000 -0500
@@ -618,6 +618,10 @@
   exe = 'gn'
   if sys.platform.startswith('linux'):
     subdir = 'linux64'
+  elif sys.platform.startswith('freebsd'):
+    subdir = '../../../../.build/install/bin'
+  elif sys.platform.startswith('midnightbsd'):
+    subdir = '../../../../.build/install/bin'
   elif sys.platform == 'darwin':
     subdir = 'mac'
   elif sys.platform == 'win32':
