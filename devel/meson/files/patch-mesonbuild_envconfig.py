--- mesonbuild/envconfig.py.orig	2022-08-13 08:48:38 UTC
+++ mesonbuild/envconfig.py
@@ -333,6 +333,10 @@ class MachineInfo(HoldableObject):
         """Machine is FreeBSD?"""
         return self.system == 'freebsd'
 
+    def is_midnightbsd(self) -> bool:
+        """Machine is MidnightBSD?"""
+        return self.system == 'midnightbsd'
+
     def is_sunos(self) -> bool:
         """Machine is illumos or Solaris?"""
         return self.system == 'sunos'
