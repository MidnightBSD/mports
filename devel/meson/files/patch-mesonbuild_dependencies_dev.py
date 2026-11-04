--- mesonbuild/dependencies/dev.py.orig	2023-05-23 15:20:02 UTC
+++ mesonbuild/dependencies/dev.py
@@ -519,7 +519,7 @@ class ZlibSystemDependency(SystemDependency):
         # I'm not sure this is entirely correct. What if we're cross compiling
         # from something to macOS?
         if ((m.is_darwin() and isinstance(self.clib_compiler, (AppleClangCCompiler, AppleClangCPPCompiler))) or
-                m.is_freebsd() or m.is_dragonflybsd() or m.is_android()):
+                m.is_freebsd() or m.is_midnightbsd() or m.is_dragonflybsd() or m.is_android()):
             # No need to set includes,
             # on macos xcode/clang will do that for us.
             # on freebsd zlib.h is in /usr/include
