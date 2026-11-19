--- setup.py.orig
+++ setup.py
@@ -11,4 +11,7 @@
 import subprocess
 import sys
 import sysconfig
-from setuptools.command.bdist_wheel import bdist_wheel
+try:
+    from setuptools.command.bdist_wheel import bdist_wheel
+except ImportError:
+    from wheel.bdist_wheel import bdist_wheel
@@ -662,2 +665,2 @@
             # Don't apply this trick to dependencies that are always on the OS (e.g. librt)
-            libraries = [':lib{}.a'.format(x) for x in libraries]
+            libraries = [':lib{}.so'.format(x) for x in libraries]
