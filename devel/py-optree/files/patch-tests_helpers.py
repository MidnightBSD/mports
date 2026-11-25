--- tests/helpers.py.orig	2026-11-25 00:42:15 UTC
+++ tests/helpers.py
@@ -208,7 +208,7 @@ def check_script_in_subprocess(
                     for key, value in (env if env is not None else os.environ).items()
                     if (
                         not key.startswith(('PYTHON', 'PYTEST', 'COV_'))
-                        or key in ('PYTHON_GIL', 'PYTHONDEVMODE', 'PYTHONHASHSEED')
+                        or key in ('PYTHON_GIL', 'PYTHONDEVMODE', 'PYTHONHASHSEED', 'PYTHONPATH')
                     )
                 },
             )
