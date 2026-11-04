--- mesonbuild/scripts/symbolextractor.py.orig	2022-06-19 19:10:07 UTC
+++ mesonbuild/scripts/symbolextractor.py
@@ -286,7 +286,7 @@ def gen_symbols(libfilename: str, impfil
         osx_syms(libfilename, outfilename)
     elif mesonlib.is_openbsd():
         openbsd_syms(libfilename, outfilename)
-    elif mesonlib.is_freebsd():
+    elif mesonlib.is_freebsd() or mesonlib.is_midnightbsd():
         freebsd_syms(libfilename, outfilename)
     elif mesonlib.is_netbsd():
         freebsd_syms(libfilename, outfilename)
