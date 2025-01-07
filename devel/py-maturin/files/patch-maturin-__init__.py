--- maturin/__init__.py.orig	2024-03-21 08:30:28.000000000 -0400
+++ maturin/__init__.py	2025-01-07 12:04:38.856868000 -0500
@@ -64,11 +64,11 @@
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
