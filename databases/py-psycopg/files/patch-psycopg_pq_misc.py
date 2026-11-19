--- psycopg/pq/misc.py.orig
+++ psycopg/pq/misc.py
@@ -73,2 +73,7 @@ def find_libpq_full_path() -> str | None:
+    elif sys.platform.startswith("midnightbsd"):
+        # ctypes.util.find_library does not recognize MidnightBSD's ldconfig.
+        # The pgsql extension records a dependency on this libpq SONAME.
+        libname = ctypes.util.find_library("pq") or "libpq.so.5"
+
     else:
         libname = ctypes.util.find_library("pq")
