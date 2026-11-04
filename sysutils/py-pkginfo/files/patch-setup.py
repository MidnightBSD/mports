--- setup.py.orig	2025-03-15 17:36:50 UTC
+++ setup.py
@@ -52,10 +52,5 @@ setup(
     ],
     python_requires='>=3.8',
-    entry_points={
-        'console_scripts': [
-            'pkginfo = pkginfo.commandline:main',
-        ]
-    },
     packages=['pkginfo', 'pkginfo.tests'],
     package_data={'pkginfo': ['py.typed', '*.pyi']},
     **extras
