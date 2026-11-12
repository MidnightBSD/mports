--- tests/optional.py.orig
+++ tests/optional.py
@@ -57,7 +57,7 @@
     # Extract the configured optional-tests from pytest's ini config in a
     # version-agnostic way. Depending on pytest version, the value can be a
     # string, a list of strings, or a ConfigValue wrapper (with a `.value` attr).
-    raw_ot_ini: Any = config.inicfg.get("optional-tests")
+    raw_ot_ini: Any = config.getini("optional-tests")
     ot_ini_lines: list[str] = []
     if raw_ot_ini:
         value = getattr(raw_ot_ini, "value", raw_ot_ini)
