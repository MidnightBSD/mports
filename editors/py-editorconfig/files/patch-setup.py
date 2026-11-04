--- setup.py.orig	2020-12-23 04:10:19 UTC
+++ setup.py
@@ -19,11 +19,6 @@ setup(
     license='python',
     description='EditorConfig File Locator and Interpreter for Python',
     long_description=open('README.rst').read(),
-    entry_points = {
-        'console_scripts': [
-            'editorconfig = editorconfig.__main__:main',
-        ]
-    },
     classifiers=[
         'License :: OSI Approved :: Python Software Foundation License',
         'Operating System :: OS Independent',
