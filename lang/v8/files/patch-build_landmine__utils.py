--- build/landmine_utils.py.orig	2021-09-12 15:20:21 UTC
+++ build/landmine_utils.py
@@ -11,7 +11,7 @@ def IsWindows():
 
 
 def IsLinux():
-  return sys.platform.startswith(('linux', 'freebsd', 'netbsd', 'openbsd'))
+  return sys.platform.startswith(('linux', 'freebsd', 'netbsd', 'openbsd', 'midnightbsd'))
 
 
 def IsMac():
