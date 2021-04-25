--- mesonbuild/scripts/symbolextractor.py.orig	2021-04-25 16:22:13 UTC
+++ mesonbuild/scripts/symbolextractor.py
@@ -189,6 +189,24 @@ def freebsd_syms(libfilename: str, outfi
     result += [' '.join(x.split()[0:2]) for x in output.split('\n')]
     write_if_changed('\n'.join(result) + '\n', outfilename)
 
+def midnightbsd_syms(libfilename: str, outfilename: str) -> None:
+    # Get the name of the library
+    output = call_tool('readelf', ['-d', libfilename])
+    if not output:
+        dummy_syms(outfilename)
+        return
+    result = [x for x in output.split('\n') if 'SONAME' in x]
+    assert(len(result) <= 1)
+    # Get a list of all symbols exported
+    output = call_tool('nm', ['--dynamic', '--extern-only', '--defined-only',
+                              '--format=posix', libfilename])
+    if not output:
+        dummy_syms(outfilename)
+        return
+            
+    result += [' '.join(x.split()[0:2]) for x in output.split('\n')]
+    write_if_changed('\n'.join(result) + '\n', outfilename)
+
 def cygwin_syms(impfilename: str, outfilename: str) -> None:
     # Get the name of the library
     output = call_tool('dlltool', ['-I', impfilename])
@@ -288,6 +306,8 @@ def gen_symbols(libfilename: str, impfil
         openbsd_syms(libfilename, outfilename)
     elif mesonlib.is_freebsd():
         freebsd_syms(libfilename, outfilename)
+    elif mesonlib.is_midnightbsd():
+        midnightbsd_syms(libfilename, outfilename)
     elif mesonlib.is_windows():
         if os.path.isfile(impfilename):
             windows_syms(impfilename, outfilename)
