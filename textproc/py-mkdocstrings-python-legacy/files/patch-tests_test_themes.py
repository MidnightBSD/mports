--- tests/test_themes.py.orig
+++ tests/test_themes.py
@@ -22,11 +22,11 @@
 @pytest.mark.parametrize(
     "module",
     [
-        "mkdocstrings.extension",
-        "mkdocstrings.inventory",
-        "mkdocstrings.loggers",
-        "mkdocstrings.handlers.base",
-        "mkdocstrings.handlers.rendering",
+        "mkdocstrings._internal.extension",
+        "mkdocstrings._internal.inventory",
+        "mkdocstrings._internal.loggers",
+        "mkdocstrings._internal.handlers.base",
+        "mkdocstrings._internal.handlers.rendering",
         "mkdocstrings_handlers.python.handler",
         "mkdocstrings_handlers.python.rendering",
     ],
