--- src/3rdparty/gn/build/gen.py.orig	2024-02-10 00:23:21 UTC
+++ src/3rdparty/gn/build/gen.py
@@ -47,6 +47,8 @@ class Platform(object):
       self._platform = 'fuchsia'
     elif self._platform.startswith('freebsd'):
       self._platform = 'freebsd'
+    elif self._platform.startswith('midnightbsd'):
+      self._platform = 'midnightbsd'
     elif self._platform.startswith('netbsd'):
       self._platform = 'netbsd'
     elif self._platform.startswith('openbsd'):
@@ -60,7 +62,7 @@ class Platform(object):
 
   @staticmethod
   def known_platforms():
-    return ['linux', 'darwin', 'mingw', 'msys', 'msvc', 'aix', 'fuchsia', 'freebsd', 'netbsd', 'openbsd', 'haiku', 'solaris', 'zos']
+    return ['linux', 'darwin', 'mingw', 'msys', 'msvc', 'aix', 'fuchsia', 'freebsd', 'midnightbsd', 'netbsd', 'openbsd', 'haiku', 'solaris', 'zos']
 
   def platform(self):
     return self._platform
@@ -92,8 +94,14 @@ class Platform(object):
   def is_solaris(self):
     return self._platform == 'solaris'
 
+  def is_midnightbsd(self):
+    return self._platform == 'midnightbsd'
+
+  def is_freebsd(self):
+    return self._platform == 'freebsd'
+
   def is_posix(self):
-    return self._platform in ['linux', 'freebsd', 'darwin', 'aix', 'openbsd', 'haiku', 'solaris', 'msys', 'netbsd']
+    return self._platform in ['linux', 'freebsd', 'midnightbsd', 'darwin', 'aix', 'openbsd', 'haiku', 'solaris', 'msys', 'netbsd']
 
   def is_zos(self):
     return self._platform == 'zos'
@@ -294,7 +302,7 @@ def WriteGenericNinja(path, static_libraries, executab
       'linux': 'build_linux.ninja.template',
       'freebsd': 'build_linux.ninja.template',
       'aix': 'build_aix.ninja.template',
-      'openbsd': 'build_openbsd.ninja.template',
+      'midnightbsd': 'build_linux.ninja.template',
       'haiku': 'build_haiku.ninja.template',
       'solaris': 'build_linux.ninja.template',
       'netbsd': 'build_linux.ninja.template',
