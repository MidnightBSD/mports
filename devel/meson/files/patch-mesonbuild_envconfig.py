--- mesonbuild/envconfig.py.orig	2021-02-08 21:39:00 UTC
+++ mesonbuild/envconfig.py
@@ -326,6 +326,10 @@ class MachineInfo:
         """Machine is FreeBSD?"""
         return self.system == 'freebsd'
 
+    def is_midnightbsd(self) -> bool:
+        """Machine is MidnightBSD?"""
+        return self.system == 'midnightbsd'
+
     def is_sunos(self) -> bool:
         """Machine is illumos or Solaris?"""
         return self.system == 'sunos'
