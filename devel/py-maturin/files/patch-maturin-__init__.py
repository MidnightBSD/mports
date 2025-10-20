--- maturin/__init__.py.orig	2024-03-21 12:30:28 UTC
+++ maturin/__init__.py
@@ -64,11 +64,11 @@ def _build_wheel(
     # PEP 517 specifies that only `sys.executable` points to the correct
     # python interpreter
     base_command = [
-        "maturin",
+        "maturin-3.11",
         "pep517",
         "build-wheel",
         "-i",
-        sys.executable,
+        "python3.11",
     ]
     options = _additional_pep517_args()
     if editable:
