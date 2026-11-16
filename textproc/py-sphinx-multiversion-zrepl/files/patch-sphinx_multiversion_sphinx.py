Obtained from: https://github.com/sphinx-contrib/multiversion/pull/202

--- sphinx_multiversion/sphinx.py.orig
+++ sphinx_multiversion/sphinx.py
@@ -11,0 +12 @@
+from sphinx.util.tags import Tags
@@ -173 +174 @@
-    old_config = sphinx_config.Config.read(data["confdir"])
+    old_config = sphinx_config.Config.read(data["confdir"], overrides={}, tags=Tags())
