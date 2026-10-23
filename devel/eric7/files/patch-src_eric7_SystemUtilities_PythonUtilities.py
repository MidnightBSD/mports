--- src/eric7/SystemUtilities/PythonUtilities.py.orig	2026-10-02 13:51:07 UTC
+++ src/eric7/SystemUtilities/PythonUtilities.py
@@ -26,7 +26,7 @@ def getPythonExecutable():
     @return path of the Python executable
     @rtype str
     """
-    if sys.platform.startswith(("linux", "freebsd")):
+    if sys.platform.startswith(("linux", "freebsd", "midnightbsd")):
         return sys.executable
     if sys.platform == "darwin":
         return sys.executable.replace("pythonw", "python")
