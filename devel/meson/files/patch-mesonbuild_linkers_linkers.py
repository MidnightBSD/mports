--- mesonbuild/linkers/linkers.py.orig	2022-09-17 14:11:42.083541000 -0400
+++ mesonbuild/linkers/linkers.py	2022-09-17 14:12:13.075894000 -0400
@@ -208,7 +208,7 @@
 
     def get_std_link_args(self, is_thin: bool) -> T.List[str]:
         # FIXME: osx ld rejects this: "file built for unknown-unsupported file format"
-        if is_thin and not mesonlib.is_osx():
+        if is_thin and not mesonlib.is_osx() and not mesonlib.is_midnightbsd():
             return self.std_thin_args
         else:
             return self.std_args
