--- mesonbuild/linkers/linkers.py.orig	2023-05-25 18:35:03 UTC
+++ mesonbuild/linkers/linkers.py
@@ -214,7 +214,7 @@ class ArLinker(ArLikeLinker):
         # OS X ld rejects with: "file built for unknown-unsupported file format"
         # illumos/Solaris ld rejects with: "unknown file type"
         if is_thin and not env.machines[self.for_machine].is_darwin() \
-          and not env.machines[self.for_machine].is_sunos():
+          and not env.machines[self.for_machine].is_sunos() and not env.machines[self.for_machine].is_midnightbsd():
             return self.std_thin_args
         else:
             return self.std_args
