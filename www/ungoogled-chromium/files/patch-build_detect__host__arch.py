--- build/detect_host_arch.py.orig	2026-10-26 21:13:13 UTC
+++ build/detect_host_arch.py
@@ -19,6 +19,8 @@
         host_arch = 'ia32'
     elif host_arch in ['x86_64', 'amd64']:
         host_arch = 'x64'
+    elif host_arch.startswith('arm64'):
+        host_arch = 'arm64'
     elif host_arch.startswith('arm'):
         host_arch = 'arm'
     elif host_arch.startswith('aarch64'):
