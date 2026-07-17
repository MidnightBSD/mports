--- versioneer.py.orig
+++ versioneer.py
@@ -342 +342 @@
-    parser = configparser.SafeConfigParser()
+    parser = configparser.ConfigParser()
@@ -344 +344 @@
-        parser.readfp(f)
+        parser.read_file(f)
