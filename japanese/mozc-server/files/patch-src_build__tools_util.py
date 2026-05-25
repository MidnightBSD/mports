--- src/build_tools/util.py.orig	2026-05-25 12:18:41.600922000 -0400
+++ src/build_tools/util.py	2026-05-25 11:58:31.915897000 -0400
@@ -56,7 +56,7 @@
 
 def IsLinux():
   """Returns true if the platform is Linux."""
-  return os.name == 'posix' and ( os.uname()[0] == 'Linux' or os.uname()[0] == 'FreeBSD' )
+  return os.name == 'posix' and ( os.uname()[0] == 'Linux' or os.uname()[0] == 'FreeBSD' or os.uname()[0] == 'MidnightBSD' )
 
 
 def GetNumberOfProcessors():
