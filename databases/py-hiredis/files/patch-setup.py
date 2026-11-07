--- setup.py.orig
+++ setup.py
@@ -21,2 +21 @@
-    hiredis_sources = ("alloc", "async", "hiredis", "net", "read", "sds", "sockcompat")
-    return sorted(glob.glob("src/*.c") + ["vendor/hiredis/%s.c" % src for src in hiredis_sources])
+    return sorted(glob.glob("src/*.c"))
@@ -43 +42 @@
-        return []
+        return ["hiredis"]
@@ -51 +50,2 @@
-                include_dirs=["vendor"])
+                include_dirs=["%%LOCALBASE%%/include"],
+                library_dirs=["%%LOCALBASE%%/lib"])
