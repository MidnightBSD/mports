--- test/integration/test_runner.py.orig
+++ test/integration/test_runner.py
@@ -143 +143 @@
-    rc.command = ['bash', '-c', "(yes)"]
+    rc.command = [os.environ.get('BASH', 'bash'), '-c', "(yes)"]
