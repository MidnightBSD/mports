--- setup.py.orig
+++ setup.py
@@
-defaults = dist.standard_setup_keywords()
+defaults = dist.standard_setup_keywords(
+	build_extensions = sys.version_info[:2] < (3, 11)
+)
