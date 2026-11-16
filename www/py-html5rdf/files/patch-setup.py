Obtained from:  https://github.com/RDFLib/html5rdf/commit/3b49bab9e4ca79e54d37f47711f558b525eb2db3
		https://github.com/RDFLib/html5rdf/commit/eb0fbab7ba6b7b855c150c3fe42633d860f629c1

--- setup.py.orig	2024-10-23 11:21:43 UTC
+++ setup.py
@@ -90,2 +90,2 @@
-                isinstance(a.value, ast.Str)):
-            version = a.value.s
+                isinstance(a.value, ast.Constant)):
+            version = a.value.value

       version=version,
