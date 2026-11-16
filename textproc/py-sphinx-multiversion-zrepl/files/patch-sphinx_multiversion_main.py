Obtained from: https://github.com/sphinx-contrib/multiversion/pull/202

--- sphinx_multiversion/main.py.orig
+++ sphinx_multiversion/main.py
@@ -17,0 +18 @@
+from sphinx.util.tags import Tags
@@ -37 +38 @@
-                confpath, confoverrides,
+                confpath, overrides=confoverrides, tags=Tags(),
