--- Lib/test/test_fcntl.py.orig	2012-04-09 23:07:31.000000000 +0000
+++ Lib/test/test_fcntl.py	2013-02-08 21:51:55.000000000 +0000
@@ -27,7 +27,7 @@
         else:
             start_len = "qq"
 
-    if (sys.platform.startswith(('netbsd', 'freebsd', 'openbsd', 'bsdos'))
+    if (sys.platform.startswith(('netbsd', 'midnightbsd', 'freebsd', 'openbsd', 'bsdos'))
         or sys.platform == 'darwin'):
         if struct.calcsize('l') == 8:
             off_t = 'l'
