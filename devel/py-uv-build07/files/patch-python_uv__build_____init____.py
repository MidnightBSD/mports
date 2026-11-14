--- python/uv_build/__init__.py.orig
+++ python/uv_build/__init__.py
@@ -41 +41 @@
-    import shutil
+    from pathlib import Path
@@ -47,4 +47,3 @@
-    uv_bin_name = "uv" if USE_UV_EXECUTABLE else "uv-build"
-    # Unlike `find_uv_bin`, this mechanism must work according to PEP 517
-    uv_bin = shutil.which(uv_bin_name)
-    if uv_bin is None:
+    uv_bin_name = "uv-build"
+    uv_bin = str(Path(__file__).resolve().parent.parent / "bin" / uv_bin_name)
+    if not Path(uv_bin).is_file():
@@ -52 +51 @@
-    build_backend_args = ["build-backend"] if USE_UV_EXECUTABLE else []
+    build_backend_args = []
