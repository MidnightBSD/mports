--- versioneer.py.orig
+++ versioneer.py
@@ -399 +399 @@
-    parser = configparser.SafeConfigParser()
+    parser = configparser.ConfigParser()
@@ -401 +401 @@
-        parser.readfp(f)
+        parser.read_file(f)
