--- setup.py.orig	2021-05-03 05:47:56.000000000 -0400
+++ setup.py	2021-05-23 17:36:32.670873000 -0400
@@ -1457,7 +1457,7 @@
             self.missing.extend(['resource', 'termios'])
 
         # Platform-specific libraries
-        if HOST_PLATFORM.startswith(('linux', 'freebsd', 'gnukfreebsd')):
+        if HOST_PLATFORM.startswith(('linux', 'midnightbsd', 'freebsd', 'gnukfreebsd')):
             self.add(Extension('ossaudiodev', ['ossaudiodev.c']))
         elif not AIX:
             self.missing.append('ossaudiodev')
@@ -2051,7 +2051,7 @@
         undef_macros = []
         if '--with-system-libmpdec' in sysconfig.get_config_var("CONFIG_ARGS"):
             include_dirs = []
-            libraries = [':libmpdec.so.2']
+            libraries = ['mpdec']
             sources = ['_decimal/_decimal.c']
             depends = ['_decimal/docstrings.h']
         else:
