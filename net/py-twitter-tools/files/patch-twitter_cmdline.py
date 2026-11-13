--- twitter/cmdline.py.orig
+++ twitter/cmdline.py
@@ -753,6 +753,9 @@
         print(file=sys.stderr)
         raise SystemExit(1)
 
+    if arg_options.get('action') == 'help':
+        return HelpAction()(None, arg_options)
+
     config_path = os.path.expanduser(
         arg_options.get('config_filename') or OPTIONS.get('config_filename'))
     config_options = loadConfig(config_path)
