--- setup.py.orig	2026-09-16 00:00:00 UTC
+++ setup.py
@@ -29,7 +29,7 @@
 ]
 
 extras_require = {
-    'crt': ['awscrt==0.36.0'],
+    'crt': ['awscrt>=0.23.8'],
 }
 
 setup(
