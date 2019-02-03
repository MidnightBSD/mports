--- build/gyp/pylib/gyp/common.py.orig	2016-12-27 19:29:34.000000000 -0500
+++ build/gyp/pylib/gyp/common.py	2016-12-27 19:30:20.000000000 -0500
@@ -378,6 +378,8 @@
     return 'solaris'
   if sys.platform.startswith('freebsd'):
     return 'freebsd'
+  if sys.platform.startswith('midnightbsd'):
+    return 'midnightbsd'
 
   return 'linux'
 
