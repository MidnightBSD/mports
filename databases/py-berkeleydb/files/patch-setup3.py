--- setup3.py.orig	2026-10-12 03:53:38 UTC
+++ setup3.py	2026-10-12 03:53:38 UTC
@@ -283,7 +283,7 @@ if os.name == 'posix':
     if not libdir:
         libdir = os.path.join(BERKELEYDB_DIR, 'lib')
     if '-ldb' not in LIBS:
-        libname = [dblib]
+        libname = ['%%BDB_LIB_NAME%%']
     else:
         if debug:
             print("LIBS already contains '-ldb' not adding our own", "'-l"+dblib+"'")
