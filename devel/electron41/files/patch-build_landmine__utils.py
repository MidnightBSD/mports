--- build/landmine_utils.py.orig	2025-08-26 20:49:50 UTC
+++ build/landmine_utils.py
@@ -11,7 +11,7 @@ def IsWindows():


 def IsLinux():
-  return sys.platform.startswith(('linux', 'freebsd', 'netbsd', 'openbsd'))
+  return sys.platform.startswith(('linux', 'freebsd', 'netbsd', 'openbsd', 'midnightbsd'))


 def IsMac():
