--- mesonbuild/modules/pkgconfig.py.orig	2026-09-09 00:00:00 UTC
+++ mesonbuild/modules/pkgconfig.py
@@ -755,8 +755,8 @@
         pcfile = filebase + '.pc'
         pkgroot = pkgroot_name = kwargs['install_dir'] or default_install_dir
         if pkgroot is None:
             m = state.environment.machines.host
-            if m.is_freebsd():
+            if m.is_freebsd() or m.is_midnightbsd():
                 pkgroot = os.path.join(_as_str(state.environment.coredata.optstore.get_value_for(OptionKey('prefix'))), 'libdata', 'pkgconfig')
                 pkgroot_name = os.path.join('{prefix}', 'libdata', 'pkgconfig')
             elif m.is_haiku():
