--- configure.py.orig	2022-08-30 19:47:02 UTC
+++ configure.py
@@ -52,6 +52,8 @@ class Platform(object):
             self._platform = 'solaris'
         elif self._platform.startswith('mingw'):
             self._platform = 'mingw'
+        elif self._platform.startswith('midnightbsd'):
+            self._platform = 'midnightbsd'
         elif self._platform.startswith('win'):
             self._platform = 'msvc'
         elif self._platform.startswith('bitrig'):
@@ -69,7 +71,7 @@ class Platform(object):
     def known_platforms():
       return ['linux', 'darwin', 'freebsd', 'openbsd', 'solaris', 'sunos5',
               'mingw', 'msvc', 'gnukfreebsd', 'bitrig', 'netbsd', 'aix',
-              'dragonfly']
+              'dragonfly', 'midnightbsd']
 
     def platform(self):
         return self._platform
@@ -103,11 +105,11 @@ class Platform(object):
         return self._platform == 'os400' or os.uname().sysname.startswith('OS400')
 
     def uses_usr_local(self):
-        return self._platform in ('freebsd', 'openbsd', 'bitrig', 'dragonfly', 'netbsd')
+        return self._platform in ('freebsd', 'openbsd', 'bitrig', 'dragonfly', 'netbsd', 'midnightbsd')
 
     def supports_ppoll(self):
         return self._platform in ('freebsd', 'linux', 'openbsd', 'bitrig',
-                                  'dragonfly')
+                                  'dragonfly', 'midnightbsd')
 
     def supports_ninja_browse(self):
         return (not self.is_windows()
@@ -333,7 +335,7 @@ if platform.is_msvc():
         cflags += ['/Ox', '/DNDEBUG', '/GL']
         ldflags += ['/LTCG', '/OPT:REF', '/OPT:ICF']
 else:
-    cflags = ['-g', '-Wall', '-Wextra',
+    cflags = ['-Wall', '-Wextra',
               '-Wno-deprecated',
               '-Wno-missing-field-initializers',
               '-Wno-unused-parameter',
