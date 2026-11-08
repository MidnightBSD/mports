--- setup.py.orig
+++ setup.py
@@ -187,9 +192,6 @@ setup_args = dict(
         "console_scripts": [
             # Install a script as "coverage".
             "coverage = coverage.cmdline:main",
-            # And as "coverage3", and as "coverage-3.7" (or whatever), but deprecated.
-            "coverage%d = coverage.cmdline:main_deprecated" % sys.version_info[:1],
-            "coverage-%d.%d = coverage.cmdline:main_deprecated" % sys.version_info[:2],
         ],
     },
     extras_require={
