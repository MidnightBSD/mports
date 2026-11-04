--- third_party/node/node.py.orig	2025-02-03 00:00:00 UTC
+++ third_party/node/node.py
@@ -18,6 +18,9 @@ def GetBinaryPath():
   return os_path.join(os_path.dirname(__file__), *{
     'Darwin': (darwin_path, darwin_name, 'bin', 'node'),
     'Linux': ('linux', 'node-linux-x64', 'bin', 'node'),
+    'FreeBSD': ('freebsd', 'node-freebsd', 'bin', 'node'),
+    'MidnightBSD': ('freebsd', 'node-freebsd', 'bin', 'node'),
+    'OpenBSD': ('openbsd', 'node-openbsd', 'bin', 'node'),
     'Windows': ('win', 'node.exe'),
   }[platform.system()])
