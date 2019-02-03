--- mesonbuild/dependencies/dev.py.orig	2018-10-15 21:03:27.833743000 -0400
+++ mesonbuild/dependencies/dev.py	2018-10-15 21:10:37.782201000 -0400
@@ -260,7 +260,7 @@
 
     def _set_new_link_args(self):
         """How to set linker args for LLVM versions >= 3.9"""
-        if ((mesonlib.is_dragonflybsd() or mesonlib.is_freebsd()) and not
+        if ((mesonlib.is_dragonflybsd() or mesonlib.is_freebsd() or mesonlib.is_midnightbsd()) and not
                 self.static and version_compare(self.version, '>= 4.0')):
             # llvm-config on DragonFly BSD and FreeBSD for versions 4.0, 5.0,
             # and 6.0 have an error when generating arguments for shared mode
