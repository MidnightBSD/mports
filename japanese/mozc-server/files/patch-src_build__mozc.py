--- src/build_mozc.py.orig
+++ src/build_mozc.py
@@ -247,6 +247,8 @@ def AddTargetPlatformOption(parser):
     default_target = 'Windows'
   elif IsMac():
     default_target = 'Mac'
+  else:
+    default_target = 'Linux'
   parser.add_option('--target_platform', dest='target_platform',
                     default=default_target,
                     help=('Linux environment can build for Linux, Android  and '
