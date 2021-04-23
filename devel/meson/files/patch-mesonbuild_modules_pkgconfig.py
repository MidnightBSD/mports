--- mesonbuild/modules/pkgconfig.py.orig	2021-02-01 15:35:16.000000000 -0500
+++ mesonbuild/modules/pkgconfig.py	2021-04-22 23:40:32.703473000 -0400
@@ -530,7 +530,7 @@
         pcfile = filebase + '.pc'
         pkgroot = kwargs.get('install_dir', default_install_dir)
         if pkgroot is None:
-            if mesonlib.is_freebsd():
+            if mesonlib.is_freebsd() or mesonlib.is_midnightbsd():
                 pkgroot = os.path.join(state.environment.coredata.get_option(mesonlib.OptionKey('prefix')), 'libdata', 'pkgconfig')
             else:
                 pkgroot = os.path.join(state.environment.coredata.get_option(mesonlib.OptionKey('libdir')), 'pkgconfig')
