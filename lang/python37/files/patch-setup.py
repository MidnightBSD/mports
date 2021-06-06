--- setup.py.orig	2021-06-06 14:12:49.843796000 -0400
+++ setup.py	2021-06-06 14:13:15.836360000 -0400
@@ -1650,7 +1650,7 @@
         # End multiprocessing
 
         # Platform-specific libraries
-        if host_platform.startswith(('linux', 'freebsd', 'gnukfreebsd')):
+        if host_platform.startswith(('linux', 'midnightbsd', 'freebsd', 'gnukfreebsd')):
             exts.append( Extension('ossaudiodev', ['ossaudiodev.c']) )
         else:
             missing.append('ossaudiodev')
@@ -2057,7 +2057,7 @@
         undef_macros = []
         if '--with-system-libmpdec' in sysconfig.get_config_var("CONFIG_ARGS"):
             include_dirs = []
-            libraries = [':libmpdec.so.2']
+            libraries = ['mpdec']
             sources = ['_decimal/_decimal.c']
             depends = ['_decimal/docstrings.h']
         else:
