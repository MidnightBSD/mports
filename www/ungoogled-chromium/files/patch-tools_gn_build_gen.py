--- tools/gn/build/gen.py.orig	2025-03-20 15:11:33.000000000 -0400
+++ tools/gn/build/gen.py	2026-04-29 15:28:44.945231000 -0400
@@ -45,7 +45,7 @@
       self._platform = 'aix'
     elif self._platform.startswith('fuchsia'):
       self._platform = 'fuchsia'
-    elif self._platform.startswith('freebsd'):
+    elif self._platform.startswith('freebsd') or self._platform.startswith('midnightbsd'):
       self._platform = 'freebsd'
     elif self._platform.startswith('netbsd'):
       self._platform = 'netbsd'
@@ -94,6 +94,12 @@
   def is_solaris(self):
     return self._platform == 'solaris'
 
+  def is_openbsd(self):
+    return self._platform == 'openbsd'
+
+  def is_freebsd(self):
+    return self._platform == 'freebsd'
+
   def is_posix(self):
     return self._platform in ['linux', 'freebsd', 'darwin', 'aix', 'openbsd', 'haiku', 'solaris', 'msys', 'netbsd', 'serenity']
 
@@ -304,7 +310,7 @@
       'linux': 'build_linux.ninja.template',
       'freebsd': 'build_linux.ninja.template',
       'aix': 'build_aix.ninja.template',
-      'openbsd': 'build_openbsd.ninja.template',
+      'openbsd': 'build_linux.ninja.template',
       'haiku': 'build_haiku.ninja.template',
       'solaris': 'build_linux.ninja.template',
       'netbsd': 'build_linux.ninja.template',
@@ -540,6 +546,9 @@
     if platform.is_posix() and not platform.is_haiku():
       ldflags.append('-pthread')
 
+    if platform.is_openbsd():
+      libs.append('-lkvm')
+
     if platform.is_mingw() or platform.is_msys():
       cflags.extend(['-DUNICODE',
                      '-DNOMINMAX',
