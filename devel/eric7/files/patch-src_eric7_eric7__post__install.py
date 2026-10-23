--- src/eric7/eric7_post_install.py.orig	2026-08-30 10:19:11 UTC
+++ src/eric7/eric7_post_install.py
@@ -230,7 +230,7 @@ def main():
     """
     if sys.platform.startswith(("win", "cygwin")):
         createWindowsLinks()
-    elif sys.platform.startswith(("linux", "freebsd")):
+    elif sys.platform.startswith(("linux", "freebsd", "midnightbsd")):
         copyLinuxMetaData()
 
     sys.exit(0)
