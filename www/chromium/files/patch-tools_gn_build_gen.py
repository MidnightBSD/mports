--- tools/gn/build/gen.py.orig	2022-09-13 15:43:35.760280600 -0400
+++ tools/gn/build/gen.py	2025-03-04 21:35:03.682696000 -0500
@@ -49,8 +49,8 @@
       self._platform = 'freebsd'
     elif self._platform.startswith('netbsd'):
       self._platform = 'netbsd'
-    elif self._platform.startswith('openbsd'):
-      self._platform = 'openbsd'
+    elif self._platform.startswith('midnightbsd'):
+      self._platform = 'freebsd'
     elif self._platform.startswith('haiku'):
       self._platform = 'haiku'
     elif self._platform.startswith('sunos'):
@@ -60,7 +60,7 @@
 
   @staticmethod
   def known_platforms():
-    return ['linux', 'darwin', 'mingw', 'msys', 'msvc', 'aix', 'fuchsia', 'freebsd', 'netbsd', 'openbsd', 'haiku', 'solaris', 'zos']
+    return ['linux', 'darwin', 'mingw', 'msys', 'msvc', 'aix', 'fuchsia', 'freebsd', 'netbsd', 'openbsd', 'haiku', 'solaris', 'zos', 'midnightbsd']
 
   def platform(self):
     return self._platform
@@ -92,8 +92,14 @@
   def is_solaris(self):
     return self._platform == 'solaris'
 
+  def is_openbsd(self):
+    return self._platform == 'openbsd'
+
+  def is_freebsd(self):
+    return self._platform in ['freebsd', 'midnightbsd']
+
   def is_posix(self):
-    return self._platform in ['linux', 'freebsd', 'darwin', 'aix', 'openbsd', 'haiku', 'solaris', 'msys', 'netbsd']
+    return self._platform in ['linux', 'freebsd', 'darwin', 'aix', 'openbsd', 'haiku', 'solaris', 'msys', 'netbsd', 'midnightbsd']
 
   def is_zos(self):
     return self._platform == 'zos'
@@ -278,8 +284,9 @@
       'darwin': 'build_mac.ninja.template',
       'linux': 'build_linux.ninja.template',
       'freebsd': 'build_linux.ninja.template',
+      'midnightbsd': 'build_linux.ninja.template',
       'aix': 'build_aix.ninja.template',
-      'openbsd': 'build_openbsd.ninja.template',
+      'openbsd': 'build_linux.ninja.template',
       'haiku': 'build_haiku.ninja.template',
       'solaris': 'build_linux.ninja.template',
       'netbsd': 'build_linux.ninja.template',
@@ -494,6 +501,9 @@
 
     if platform.is_posix() and not platform.is_haiku():
       ldflags.append('-pthread')
+
+    if platform.is_openbsd():
+      libs.append('-lkvm')
 
     if platform.is_mingw() or platform.is_msys():
       cflags.extend(['-DUNICODE',
