--- src/3rdparty/ninja/configure.py.orig	2023-03-22 10:08:34.539476000 -0400
+++ src/3rdparty/ninja/configure.py	2023-03-22 10:08:56.522685000 -0400
@@ -44,6 +44,8 @@
             self._platform = 'linux'
         elif self._platform.startswith('freebsd'):
             self._platform = 'freebsd'
+        elif self._platform.startswith('midnightbsd'):
+            self._platform = 'freebsd'
         elif self._platform.startswith('gnukfreebsd'):
             self._platform = 'freebsd'
         elif self._platform.startswith('openbsd'):
