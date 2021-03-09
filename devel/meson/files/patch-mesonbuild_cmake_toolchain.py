--- mesonbuild/cmake/toolchain.py.orig	2021-03-09 00:41:52 UTC
+++ mesonbuild/cmake/toolchain.py
@@ -136,6 +136,7 @@ class CMakeToolchain:
             'linux': 'Linux',
             'windows': 'Windows',
             'freebsd': 'FreeBSD',
+            'midnightbsd': 'FreeBSD',
             'darwin': 'Darwin',
         }  # type: T.Dict[str, str]
 
