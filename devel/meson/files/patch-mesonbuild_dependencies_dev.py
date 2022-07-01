--- mesonbuild/dependencies/dev.py.orig	2022-06-02 12:17:06.000000000 -0400
+++ mesonbuild/dependencies/dev.py	2022-07-01 08:51:32.931304000 -0400
@@ -495,7 +495,7 @@
         # I'm not sure this is entirely correct. What if we're cross compiling
         # from something to macOS?
         if ((m.is_darwin() and isinstance(self.clib_compiler, (AppleClangCCompiler, AppleClangCPPCompiler))) or
-                m.is_freebsd() or m.is_dragonflybsd() or m.is_android()):
+                m.is_freebsd() or m.is_midnightbsd() or m.is_dragonflybsd() or m.is_android()):
             # No need to set includes,
             # on macos xcode/clang will do that for us.
             # on freebsd zlib.h is in /usr/include
