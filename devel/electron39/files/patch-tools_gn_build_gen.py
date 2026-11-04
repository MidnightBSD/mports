--- tools/gn/build/gen.py.orig	2026-04-28 08:42:38 UTC
+++ tools/gn/build/gen.py
@@ -29,6 +29,8 @@
   def __init__(self, platform):
     self._platform = platform
     if self._platform is not None:
+      if self._platform.startswith("midnightbsd"):
+        self._platform = "freebsd"
       return
     self._platform = sys.platform
     if self._platform.startswith('linux'):
@@ -46,6 +48,8 @@
     elif self._platform.startswith('fuchsia'):
       self._platform = 'fuchsia'
     elif self._platform.startswith('freebsd'):
+      self._platform = 'freebsd'
+    elif self._platform.startswith('midnightbsd'):
       self._platform = 'freebsd'
     elif self._platform.startswith('netbsd'):
       self._platform = 'netbsd'
@@ -307,6 +311,8 @@
       'darwin': 'build_mac.ninja.template',
       'linux': 'build_linux.ninja.template',
       'freebsd': 'build_linux.ninja.template',
+      'midnightbsd4': 'build_linux.ninja.template',
+
       'aix': 'build_aix.ninja.template',
       'openbsd': 'build_openbsd.ninja.template',
       'haiku': 'build_haiku.ninja.template',
