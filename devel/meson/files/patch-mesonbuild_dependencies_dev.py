--- mesonbuild/dependencies/dev.py.orig	2021-08-18 07:22:33.000000000 -0400
+++ mesonbuild/dependencies/dev.py	2021-12-09 13:53:17.012187000 -0500
@@ -474,7 +474,7 @@
         # I'm not sure this is entirely correct. What if we're cross compiling
         # from something to macOS?
         if ((m.is_darwin() and isinstance(self.clib_compiler, (AppleClangCCompiler, AppleClangCPPCompiler))) or
-                m.is_freebsd() or m.is_dragonflybsd()):
+                m.is_freebsd() or m.is_midnightbsd() or m.is_dragonflybsd()):
             # No need to set includes,
             # on macos xcode/clang will do that for us.
             # on freebsd zlib.h is in /usr/include
