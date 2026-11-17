--- numba/np/ufunc/parallel.py.orig
+++ numba/np/ufunc/parallel.py
@@ -354,7 +354,7 @@
             libtbb_name = 'tbb12.dll'
         elif _IS_OSX:
             libtbb_name = 'libtbb.12.dylib'
-        elif _IS_LINUX:
+        elif _IS_LINUX or sys.platform.startswith(('freebsd', 'midnightbsd')):
             libtbb_name = 'libtbb.so.12'
         else:
             raise ValueError("Unknown operating system")
