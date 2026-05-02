--- third_party/blink/renderer/bindings/scripts/bind_gen/style_format.py.orig	2026-04-30 23:40:51.081482000 -0400
+++ third_party/blink/renderer/bindings/scripts/bind_gen/style_format.py	2026-04-30 23:40:51.086910000 -0400
@@ -30,7 +30,7 @@
 
     # Determine //buildtools/<platform>/ directory
     new_path_platform_suffix = ""
-    if sys.platform.startswith("linux"):
+    if sys.platform.startswith(("linux", "openbsd", "freebsd", "midnightbsd")):
         platform = "linux64"
         exe_suffix = ""
     elif sys.platform.startswith("darwin"):
