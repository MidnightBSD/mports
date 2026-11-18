--- pythran/config.py.orig	2026-06-22 05:22:24 UTC
+++ pythran/config.py
@@ -446,5 +446,5 @@
     if args.libs or args.verbose >= 2:
         ldflags = []
-        ldflags.extend(('-L' + compiler_obj.library_dir_option(include))
+        ldflags.extend((compiler_obj.library_dir_option(include))
                        for include in extension['library_dirs'])
         ldflags.extend((compiler_obj.library_option(include))
