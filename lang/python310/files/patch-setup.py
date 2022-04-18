--- setup.py.orig	2019-10-14 09:34:47.000000000 -0400
+++ setup.py	2019-11-07 15:37:59.129951000 -0500
@@ -1472,7 +1472,7 @@
             self.missing.extend(['resource', 'termios'])
 
         # Platform-specific libraries
-        if HOST_PLATFORM.startswith(('linux', 'freebsd', 'gnukfreebsd')):
+        if HOST_PLATFORM.startswith(('linux', 'midnightbsd', 'freebsd', 'gnukfreebsd')):
             self.add(Extension('ossaudiodev', ['ossaudiodev.c']))
         elif not AIX:
             self.missing.append('ossaudiodev')
