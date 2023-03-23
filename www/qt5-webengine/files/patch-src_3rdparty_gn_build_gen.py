--- src/3rdparty/gn/build/gen.py.orig	2020-11-06 20:22:36.000000000 -0500
+++ src/3rdparty/gn/build/gen.py	2023-03-23 14:41:20.035037000 -0400
@@ -41,12 +41,14 @@
       self._platform = 'fuchsia'
     elif self._platform.startswith('freebsd'):
       self._platform = 'freebsd'
+    elif self._platform.startswith('midnightbsd'):
+      self._platform = 'freebsd'
     elif self._platform.startswith('openbsd'):
       self._platform = 'openbsd'
 
   @staticmethod
   def known_platforms():
-    return ['linux', 'darwin', 'msvc', 'aix', 'fuchsia', 'freebsd', 'openbsd']
+    return ['linux', 'darwin', 'msvc', 'aix', 'fuchsia', 'freebsd', 'openbsd', 'midnightbsd']
 
   def platform(self):
     return self._platform
@@ -69,8 +71,14 @@
   def is_aix(self):
     return self._platform == 'aix'
 
+  def is_freebsd(self):
+    return self._platform == 'freebsd'
+
+  def is_midnightbsd(self):
+    return self._platform == 'midnightbsd'
+
   def is_posix(self):
-    return self._platform in ['linux', 'freebsd', 'darwin', 'aix', 'openbsd']
+    return self._platform in ['linux', 'freebsd', 'darwin', 'aix', 'openbsd', 'midnightbsd']
 
 
 def main(argv):
@@ -187,6 +195,7 @@
       'darwin': 'build_mac.ninja.template',
       'linux': 'build_linux.ninja.template',
       'freebsd': 'build_linux.ninja.template',
+      'midnightbsd': 'build_linux.ninja.template',
       'aix': 'build_aix.ninja.template',
       'openbsd': 'build_openbsd.ninja.template',
   }[platform.platform()])
@@ -373,6 +382,11 @@
     elif platform.is_aix():
       cflags_cc.append('-maix64')
       ldflags.append('-maix64')
+    elif platform.is_freebsd() or platform.is_midnightbsd():
+      cflags.extend(['-Wno-deprecated-register', '-Wno-parentheses-equality'])
+      ldflags.extend(['-pthread'])
+      libs.extend(['-lexecinfo', '-lkvm', '-lutil'])
+      include_dirs += ['/usr/local/include']
 
     if platform.is_posix():
       ldflags.append('-pthread')
