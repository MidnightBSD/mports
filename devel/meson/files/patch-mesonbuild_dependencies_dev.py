--- mesonbuild/dependencies/dev.py.orig	2021-03-09 00:41:22 UTC
+++ mesonbuild/dependencies/dev.py
@@ -471,7 +471,7 @@ class ZlibSystemDependency(ExternalDepen
         # I'm not sure this is entirely correct. What if we're cross compiling
         # from something to macOS?
         if ((m.is_darwin() and isinstance(self.clib_compiler, (AppleClangCCompiler, AppleClangCPPCompiler))) or
-                m.is_freebsd() or m.is_dragonflybsd()):
+                m.is_freebsd() or m.is_midnightbsd() or m.is_dragonflybsd()):
             self.is_found = True
             self.link_args = ['-lz']
 
