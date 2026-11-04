--- mesonbuild/cmake/toolchain.py.orig	2022-08-13 08:48:46 UTC
+++ mesonbuild/cmake/toolchain.py
@@ -158,6 +158,7 @@ class CMakeToolchain:
             'linux': 'Linux',
             'windows': 'Windows',
             'freebsd': 'FreeBSD',
+            'midnightbsd': 'MidnightBSD',
             'darwin': 'Darwin',
         }  # type: T.Dict[str, str]
 
