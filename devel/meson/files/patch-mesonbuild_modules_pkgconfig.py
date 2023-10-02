--- mesonbuild/modules/pkgconfig.py.orig	2022-10-24 15:25:24.000000000 -0400
+++ mesonbuild/modules/pkgconfig.py	2023-10-02 14:32:37.840065000 -0400
@@ -696,7 +696,7 @@
         pcfile = filebase + '.pc'
         pkgroot = pkgroot_name = kwargs['install_dir'] or default_install_dir
         if pkgroot is None:
-            if mesonlib.is_freebsd():
+            if mesonlib.is_freebsd() or mesonlib.is_midnightbsd():
                 pkgroot = os.path.join(_as_str(state.environment.coredata.get_option(mesonlib.OptionKey('prefix'))), 'libdata', 'pkgconfig')
                 pkgroot_name = os.path.join('{prefix}', 'libdata', 'pkgconfig')
             else:
