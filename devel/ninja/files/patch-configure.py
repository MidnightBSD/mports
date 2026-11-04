--- configure.py.orig	2025-07-10 16:43:08.000000000 -0400
+++ configure.py	2025-12-28 21:25:13.763646000 -0500
@@ -53,6 +53,8 @@
             self._platform = 'solaris'
         elif self._platform.startswith('mingw'):
             self._platform = 'mingw'
+        elif self._platform.startswith('midnightbsd'):
+            self._platform = 'midnightbsd'
         elif self._platform.startswith('win'):
             self._platform = 'msvc'
         elif self._platform.startswith('bitrig'):
@@ -70,7 +72,7 @@
     def known_platforms() -> List[str]:
       return ['linux', 'darwin', 'freebsd', 'openbsd', 'solaris', 'sunos5',
               'mingw', 'msvc', 'gnukfreebsd', 'bitrig', 'netbsd', 'aix',
-              'dragonfly']
+              'dragonfly', 'midnightbsd']
 
     def platform(self) -> str:
         return self._platform  # type: ignore # Incompatible return value type
@@ -104,11 +106,11 @@
         return self._platform == 'os400' or os.uname().sysname.startswith('OS400')  # type: ignore # Module has no attribute "uname"
 
     def uses_usr_local(self) -> bool:
-        return self._platform in ('freebsd', 'openbsd', 'bitrig', 'dragonfly', 'netbsd')
+        return self._platform in ('freebsd', 'openbsd', 'bitrig', 'dragonfly', 'netbsd', 'midnightbsd')
 
     def supports_ppoll(self) -> bool:
         return self._platform in ('freebsd', 'linux', 'openbsd', 'bitrig',
-                                  'dragonfly')
+                                  'dragonfly', 'midnightbsd')
 
     def supports_ninja_browse(self) -> bool:
         return (not self.is_windows()
@@ -360,7 +362,7 @@
         cflags += ['/Ox', '/DNDEBUG', '/GL']
         ldflags += ['/LTCG', '/OPT:REF', '/OPT:ICF']
 else:
-    cflags = ['-g', '-Wall', '-Wextra',
+    cflags = ['-Wall', '-Wextra',
               '-Wno-deprecated',
               '-Wno-missing-field-initializers',
               '-Wno-unused-parameter',
