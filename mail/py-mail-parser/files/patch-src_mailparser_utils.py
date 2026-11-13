--- src/mailparser/utils.py.orig	2020-02-02 00:00:00 UTC
+++ src/mailparser/utils.py
@@ -275,7 +275,7 @@ def custom_log(level="WARNING", name=None):  # pragma: no cover
     else:
         log = logging.getLogger()
     log.setLevel(level)
-    ch = logging.StreamHandler(sys.stdout)
+    ch = logging.StreamHandler(sys.stderr)
     formatter = logging.Formatter(
         "%(asctime)s | "
         "%(name)s | "
