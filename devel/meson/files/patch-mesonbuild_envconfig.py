--- mesonbuild/envconfig.py.orig	2023-05-23 15:20:02 UTC
+++ mesonbuild/envconfig.py
@@ -341,6 +341,10 @@ class MachineInfo(HoldableObject):
         """Machine is FreeBSD?"""
         return self.system == 'freebsd'
 
+    def is_midnightbsd(self) -> bool:
+        """Machine is MidnightBSD?"""
+        return self.system == 'midnightbsd'
+
     def is_sunos(self) -> bool:
         """Machine is illumos or Solaris?"""
         return self.system == 'sunos'
