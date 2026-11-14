--- src/filelock/_util.py.orig	2026-11-14 07:29:55 UTC
+++ src/filelock/_util.py	2026-11-14 07:29:55 UTC
@@ -81 +81,3 @@
-            os.lstat(filename)
+            if stat.S_ISLNK(os.lstat(filename).st_mode):
+                # A replacement link is contention, regardless of access() semantics.
+                return
