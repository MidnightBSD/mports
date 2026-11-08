--- test/test_contextlib.py.orig
+++ test/test_contextlib.py
@@ -497,3 +497,7 @@
-        with self.assertRaises(AttributeError):
+        if sys.version_info >= (3, 11):
+            error, message = TypeError, 'the context manager'
+        else:
+            error, message = AttributeError, '__enter__'
+        with self.assertRaisesRegex(error, message):
             with mycontext():
                 pass
@@ -509,3 +513,7 @@
-        with self.assertRaises(AttributeError):
+        if sys.version_info >= (3, 11):
+            error, message = TypeError, 'the context manager.*__exit__'
+        else:
+            error, message = AttributeError, '__exit__'
+        with self.assertRaisesRegex(error, message):
             with mycontext():
                 pass
