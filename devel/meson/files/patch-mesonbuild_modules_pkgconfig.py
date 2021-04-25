--- mesonbuild/modules/pkgconfig.py.orig	2021-02-01 20:35:16 UTC
+++ mesonbuild/modules/pkgconfig.py
@@ -530,7 +530,7 @@ class PkgConfigModule(ExtensionModule):
         pcfile = filebase + '.pc'
         pkgroot = kwargs.get('install_dir', default_install_dir)
         if pkgroot is None:
-            if mesonlib.is_freebsd():
+            if mesonlib.is_freebsd() or mesonlib.is_midnightbsd():
                 pkgroot = os.path.join(state.environment.coredata.get_option(mesonlib.OptionKey('prefix')), 'libdata', 'pkgconfig')
             else:
                 pkgroot = os.path.join(state.environment.coredata.get_option(mesonlib.OptionKey('libdir')), 'pkgconfig')
