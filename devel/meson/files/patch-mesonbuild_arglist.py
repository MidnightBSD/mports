--- mesonbuild/arglist.py.orig	2021-04-25 16:20:53 UTC
+++ mesonbuild/arglist.py
@@ -28,7 +28,7 @@ if T.TYPE_CHECKING:
 
 UNIXY_COMPILER_INTERNAL_LIBS = ['m', 'c', 'pthread', 'dl', 'rt']  # type: T.List[str]
 # execinfo is a compiler lib on FreeBSD and NetBSD
-if mesonlib.is_freebsd() or mesonlib.is_netbsd():
+if mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_midnightbsd():
     UNIXY_COMPILER_INTERNAL_LIBS.append('execinfo')
 
 
