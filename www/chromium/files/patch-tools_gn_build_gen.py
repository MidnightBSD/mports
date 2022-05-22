--- tools/gn/build/gen.py.orig	2020-09-21 18:48:29 UTC
+++ tools/gn/build/gen.py
@@ -45,6 +45,8 @@ class Platform(object):
       self._platform = 'fuchsia'
     elif self._platform.startswith('freebsd'):
       self._platform = 'freebsd'
+    elif self._platform.startswith('midnightbsd'):
+      self._platform = 'midnightbsd'
     elif self._platform.startswith('openbsd'):
       self._platform = 'openbsd'
     elif self._platform.startswith('haiku'):
@@ -52,7 +54,7 @@ class Platform(object):
 
   @staticmethod
   def known_platforms():
-    return ['linux', 'darwin', 'mingw', 'msvc', 'aix', 'fuchsia', 'freebsd', 'openbsd', 'haiku']
+    return ['linux', 'darwin', 'mingw', 'msvc', 'aix', 'fuchsia', 'freebsd', 'openbsd', 'haiku', 'midnightbsd']
 
   def platform(self):
     return self._platform
@@ -78,8 +80,14 @@ class Platform(object):
   def is_haiku(self):
     return self._platform == 'haiku'
 
+  def is_freebsd(self):
+    return self._platform in ['freebsd','midnightbsd', 'midnightbsd2']
+
+  def is_midnightbsd(self):
+    return self._platform in ['midnightbsd', 'midnightbsd2']
+
   def is_posix(self):
-    return self._platform in ['linux', 'freebsd', 'darwin', 'aix', 'openbsd', 'haiku']
+    return self._platform in ['linux', 'freebsd', 'midnightbsd', 'darwin', 'aix', 'openbsd', 'haiku']
 
 
 def main(argv):
@@ -200,6 +208,7 @@ def WriteGenericNinja(path, static_libra
       'darwin': 'build_mac.ninja.template',
       'linux': 'build_linux.ninja.template',
       'freebsd': 'build_linux.ninja.template',
+      'midnightbsd': 'build_linux.ninja.template',
       'aix': 'build_aix.ninja.template',
       'openbsd': 'build_openbsd.ninja.template',
       'haiku': 'build_haiku.ninja.template',
@@ -372,6 +381,11 @@ def WriteGNNinja(path, platform, host, o
     elif platform.is_haiku():
       cflags.append('-fPIC')
       cflags.extend(['-D_BSD_SOURCE'])
+    elif platform.is_freebsd() or platform.is_midnightbsd():
+      cflags.extend(['-Wno-deprecated-register', '-Wno-parentheses-equality'])
+      ldflags.extend(['-pthread'])
+      libs.extend(['-lexecinfo', '-lkvm', '-lutil'])
+      include_dirs += ['/usr/local/include']
 
     if platform.is_posix() and not platform.is_haiku():
       ldflags.append('-pthread')
