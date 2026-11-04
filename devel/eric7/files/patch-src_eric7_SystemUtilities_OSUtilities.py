--- src/eric7/SystemUtilities/OSUtilities.py.orig	2026-08-02 08:36:51 UTC
+++ src/eric7/SystemUtilities/OSUtilities.py
@@ -58,7 +58,7 @@ def isFreeBsdPlatform():
     @return flag indicating BSD platform
     @rtype bool
     """
-    return sys.platform.startswith("freebsd")
+    return sys.platform.startswith(("freebsd", "midnightbsd"))
 
 
 ###############################################################################
