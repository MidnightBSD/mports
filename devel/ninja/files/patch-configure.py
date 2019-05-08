--- configure.py.orig	2019-05-07 21:03:31.268580000 -0400
+++ configure.py	2019-05-07 21:15:42.452106000 -0400
@@ -52,6 +52,8 @@
             self._platform = 'solaris'
         elif self._platform.startswith('mingw'):
             self._platform = 'mingw'
+        elif self._platform.startswith('midnightbsd'):
+            self._platform = 'midnightbsd'
         elif self._platform.startswith('win'):
             self._platform = 'msvc'
         elif self._platform.startswith('bitrig'):
@@ -67,7 +69,7 @@
     def known_platforms():
       return ['linux', 'darwin', 'freebsd', 'openbsd', 'solaris', 'sunos5',
               'mingw', 'msvc', 'gnukfreebsd', 'bitrig', 'netbsd', 'aix',
-              'dragonfly']
+              'dragonfly', 'midnightbsd']
 
     def platform(self):
         return self._platform
@@ -98,11 +100,11 @@
         return self._platform == 'aix'
 
     def uses_usr_local(self):
-        return self._platform in ('freebsd', 'openbsd', 'bitrig', 'dragonfly', 'netbsd')
+        return self._platform in ('freebsd', 'openbsd', 'bitrig', 'dragonfly', 'netbsd', 'midnightbsd')
 
     def supports_ppoll(self):
         return self._platform in ('freebsd', 'linux', 'openbsd', 'bitrig',
-                                  'dragonfly')
+                                  'dragonfly', 'midnightbsd')
 
     def supports_ninja_browse(self):
         return (not self.is_windows()
