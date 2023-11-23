--- mesonbuild/modules/pkgconfig.py.orig	2023-11-23 13:38:47.664832000 -0500
+++ mesonbuild/modules/pkgconfig.py	2023-11-23 13:39:11.719796000 -0500
@@ -696,7 +696,7 @@
         pcfile = filebase + '.pc'
         pkgroot = pkgroot_name = kwargs['install_dir'] or default_install_dir
         if pkgroot is None:
-            if mesonlib.is_freebsd():
+            if mesonlib.is_freebsd() or mesonlib.is_midnightbsd():
                 pkgroot = os.path.join(_as_str(state.environment.coredata.get_option(mesonlib.OptionKey('prefix'))), 'libdata', 'pkgconfig')
                 pkgroot_name = os.path.join('{prefix}', 'libdata', 'pkgconfig')
             elif mesonlib.is_haiku():
