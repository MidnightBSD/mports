--- setup.py.orig	2021-05-11 17:21:06 UTC
+++ setup.py
@@ -25,7 +25,7 @@ if sys.version_info < (2, 4):
     sys.exit(1)
 
 # check linux platform
-if not platform.startswith('linux') and not platform.startswith('freebsd'):
+if not platform.startswith('linux') and not platform.startswith('freebsd') and not platform.startswith('midnightbsd'):
     sys.stderr.write("inotify is not available on %s\n" % platform)
     sys.exit(1)
 
