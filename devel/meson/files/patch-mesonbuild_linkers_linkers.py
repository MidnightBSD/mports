--- mesonbuild/linkers/linkers.py.orig	2022-08-13 04:48:38.000000000 -0400
+++ mesonbuild/linkers/linkers.py	2023-10-02 14:15:37.744887000 -0400
@@ -209,7 +209,7 @@
 
     def get_std_link_args(self, env: 'Environment', is_thin: bool) -> T.List[str]:
         # FIXME: osx ld rejects this: "file built for unknown-unsupported file format"
-        if is_thin and not env.machines[self.for_machine].is_darwin():
+        if is_thin and not env.machines[self.for_machine].is_darwin() and not env.machines[self.for_machine].is_midnightbsd():
             return self.std_thin_args
         else:
             return self.std_args
