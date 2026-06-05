--- setup.py.orig
+++ setup.py
@@ -48,4 +48,4 @@
       extras_require={
           'unidic': ['unidic'],
           'unidic-lite': ['unidic-lite'],
       },
-      setup_requires=['wheel', 'Cython~=3.0.11', 'setuptools_scm'])
+      setup_requires=['wheel', 'Cython>=3.0.11', 'setuptools_scm'])
