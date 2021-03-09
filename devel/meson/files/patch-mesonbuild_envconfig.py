--- mesonbuild/envconfig.py.orig	2021-01-06 10:39:48 UTC
+++ mesonbuild/envconfig.py
@@ -318,6 +318,10 @@ class MachineInfo:
         """Machine is FreeBSD?"""
         return self.system == 'freebsd'
 
+    def is_midnightbsd(self) -> bool:
+        """Machine is MidnightBSD?"""
+        return self.system == 'midnightbsd'
+
     def is_sunos(self) -> bool:
         """Machine is illumos or Solaris?"""
         return self.system == 'sunos'
