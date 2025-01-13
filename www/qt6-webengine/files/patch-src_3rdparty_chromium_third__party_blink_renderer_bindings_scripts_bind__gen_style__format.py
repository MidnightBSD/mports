--- src/3rdparty/chromium/third_party/blink/renderer/bindings/scripts/bind_gen/style_format.py.orig	2024-02-09 19:23:21.000000000 -0500
+++ src/3rdparty/chromium/third_party/blink/renderer/bindings/scripts/bind_gen/style_format.py	2025-01-13 14:56:45.409480000 -0500
@@ -28,7 +28,7 @@
     root_src_dir = os.path.abspath(root_src_dir)
 
     # Determine //buildtools/<platform>/ directory
-    if sys.platform.startswith("linux"):
+    if sys.platform.startswith(("linux","openbsd","freebsd","midnightbsd")):
         platform = "linux64"
         exe_suffix = ""
     elif sys.platform.startswith("darwin"):
