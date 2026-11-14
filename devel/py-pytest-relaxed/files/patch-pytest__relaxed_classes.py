--- pytest_relaxed/classes.py.orig	2023-05-23 03:22:32 UTC
+++ pytest_relaxed/classes.py
@@ -9,0 +10 @@
+from _pytest.fixtures import getfixturemarker
@@ -31 +32 @@
-    is_fixture = hasattr(obj, "_pytestfixturefunction")
+    is_fixture = getfixturemarker(obj) is not None
