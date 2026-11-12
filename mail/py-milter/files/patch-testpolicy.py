--- testpolicy.py.orig
+++ testpolicy.py
@@ -20 +20 @@
-        cmd = 'tr : ! <test/access | makemap hash test/access.db'
+        cmd = 'tr : ! <test/access | makemap -N hash test/access.db'
