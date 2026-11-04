--- setup.py.orig	2026-05-11 22:03:36 UTC
+++ setup.py
@@ -21,5 +21,7 @@ sys.path.insert(0, '')
 sys.dont_write_bytecode = True
 import postgresql.release.distutils as dist
-defaults = dist.standard_setup_keywords()
+defaults = dist.standard_setup_keywords(
+	build_extensions = sys.version_info[:2] < (3, 11)
+)
 sys.dont_write_bytecode = False
 if __name__ == '__main__':
