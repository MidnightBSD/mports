--- setup.py.orig	2018-09-23 17:48:07.561206000 -0400
+++ setup.py	2018-09-23 17:48:35.909605000 -0400
@@ -1603,7 +1603,7 @@
         # End multiprocessing
 
         # Platform-specific libraries
-        if host_platform.startswith(('linux', 'freebsd', 'gnukfreebsd')):
+        if host_platform.startswith(('linux', 'midnightbsd', 'freebsd', 'gnukfreebsd')):
             exts.append( Extension('ossaudiodev', ['ossaudiodev.c']) )
         else:
             missing.append('ossaudiodev')
