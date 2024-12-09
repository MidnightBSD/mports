--- mesonbuild/modules/pkgconfig.py.orig	2024-10-20 14:20:39.000000000 -0400
+++ mesonbuild/modules/pkgconfig.py	2024-12-07 14:47:48.884527000 -0500
@@ -701,7 +701,7 @@
         pcfile = filebase + '.pc'
         pkgroot = pkgroot_name = kwargs['install_dir'] or default_install_dir
         if pkgroot is None:
-            if mesonlib.is_freebsd():
+            if mesonlib.is_freebsd() or mesonlib.is_midnightbsd():
                 pkgroot = os.path.join(_as_str(state.environment.coredata.get_option(OptionKey('prefix'))), 'libdata', 'pkgconfig')
                 pkgroot_name = os.path.join('{prefix}', 'libdata', 'pkgconfig')
             elif mesonlib.is_haiku():
