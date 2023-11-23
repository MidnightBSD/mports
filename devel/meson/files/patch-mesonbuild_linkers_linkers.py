--- mesonbuild/linkers/linkers.py.orig	2022-11-21 14:54:10.000000000 -0500
+++ mesonbuild/linkers/linkers.py	2023-11-23 13:32:49.786668000 -0500
@@ -213,7 +213,7 @@
         # OS X ld rejects with: "file built for unknown-unsupported file format"
         # illumos/Solaris ld rejects with: "unknown file type"
         if is_thin and not env.machines[self.for_machine].is_darwin() \
-          and not env.machines[self.for_machine].is_sunos():
+          and not env.machines[self.for_machine].is_sunos() and not env.machines[self.for_machine].is_midnightbsd():
             return self.std_thin_args
         else:
             return self.std_args
