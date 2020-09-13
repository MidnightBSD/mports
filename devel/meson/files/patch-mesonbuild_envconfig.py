--- mesonbuild/envconfig.py.orig	2020-07-08 12:43:34.482860000 -0400
+++ mesonbuild/envconfig.py	2020-07-08 12:44:56.974982000 -0400
@@ -289,6 +289,10 @@
         """Machine is FreeBSD?"""
         return self.system == 'freebsd'
 
+    def is_midnightbsd(self) -> bool:
+        """Machine is MidnightBSD?"""
+        return self.system == 'midnightbsd'
+
     def is_sunos(self) -> bool:
         """Machine is illumos or Solaris?"""
         return self.system == 'sunos'
