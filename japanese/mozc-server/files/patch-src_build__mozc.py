--- src/build_mozc.py.orig
+++ src/build_mozc.py
@@ -246,6 +246,8 @@ def AddTargetPlatformOption(parser):
   elif IsMac():
     default_target = 'Mac'
+  else:
+    default_target = 'Linux'
   parser.add_option('--target_platform', dest='target_platform',
