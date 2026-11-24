--- setup.py.orig	2025-07-25 08:24:07 UTC
+++ setup.py
@@ -314,4 +314,0 @@
-        if 'CMAKE_BUILD_PARALLEL_LEVEL' not in os.environ and bool(getattr(self, 'parallel', 0)):
-            build_args += ['--parallel', str(self.parallel)]
-        else:
-            build_args += ['--parallel']
