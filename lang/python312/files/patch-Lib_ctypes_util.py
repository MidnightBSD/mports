--- Lib/ctypes/util.py.orig	2026-09-30 22:04:19 UTC
+++ Lib/ctypes/util.py
@@ -193,7 +193,7 @@
                 return None
             return os.fsdecode(res.group(1))
 
-    if sys.platform.startswith(("freebsd", "openbsd", "dragonfly")):
+    if sys.platform.startswith(("freebsd", "openbsd", "dragonfly", "midnightbsd")):
 
         def _num_version(libname):
             # "libxyz.so.MAJOR.MINOR" => [ MAJOR, MINOR ]
