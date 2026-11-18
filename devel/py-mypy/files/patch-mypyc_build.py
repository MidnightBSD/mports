--- mypyc/build.py.orig
+++ mypyc/build.py
@@ -491 +491,6 @@
     from setuptools.command.build_ext import build_ext as _build_ext
+
+    # Older setuptools releases copy the extensions without this helper.
+    # Keep their normal copy behavior when the optimization is unavailable.
+    if not hasattr(_build_ext, "_get_inplace_equivalent"):
+        return
