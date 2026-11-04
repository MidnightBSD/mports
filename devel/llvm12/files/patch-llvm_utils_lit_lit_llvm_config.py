--- llvm/utils/lit/lit/llvm/config.py.orig	2023-12-19 23:02:26.758550000 -0500
+++ llvm/utils/lit/lit/llvm/config.py	2023-12-19 23:02:50.321770000 -0500
@@ -62,7 +62,7 @@
             features.add('system-windows')
         elif platform.system() == 'Linux':
             features.add('system-linux')
-        elif platform.system() in ['FreeBSD']:
+        elif platform.system() in ['FreeBSD', 'MidnightBSD']:
             features.add('system-freebsd')
         elif platform.system() == 'NetBSD':
             features.add('system-netbsd')
