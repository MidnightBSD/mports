--- docs/ext/docstrings.py.orig
+++ docs/ext/docstrings.py
@@ -25,6 +25,9 @@
     conf: Sequence[tuple[str, bool | None, _ConfigRebuild, set[type]]] = (
         napoleon.Config._config_values
     )
+
+    if isinstance(conf, dict):
+        conf = [(name, default, rebuild, None) for name, (default, rebuild) in conf.items()]
 
     for name, default, rebuild, _ in conf:
         app.add_config_value(name, default, rebuild)
