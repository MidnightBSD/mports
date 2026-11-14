--- src/filelock/_soft_rw/_storage.py.orig	2026-11-14 07:29:55 UTC
+++ src/filelock/_soft_rw/_storage.py	2026-11-14 07:29:55 UTC
@@ -13 +13 @@
-from errno import ELOOP, ENOENT, ENOTDIR, ENXIO, ESTALE
+from errno import ELOOP, EMLINK, ENOENT, ENOTDIR, ENXIO, ESTALE
@@ -232 +232 @@
-                    if error.errno not in {ELOOP, ENOTDIR, getattr(errno, "EFTYPE", ELOOP)}:
+                    if error.errno not in {ELOOP, EMLINK, ENOTDIR, getattr(errno, "EFTYPE", ELOOP)}:
