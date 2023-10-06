--- setup_cares.py.orig	2022-12-10 16:30:07.000000000 -0500
+++ setup_cares.py	2023-10-06 09:37:24.447969000 -0400
@@ -102,6 +102,9 @@
         elif sys.platform.startswith('freebsd'):
             self.add_include_dir(os.path.join(self.build_config_dir, 'config_freebsd'))
             self.compiler.add_library('kvm')
+        elif sys.platform.startswith('midnightbsd'):
+            self.compiler.add_include_dir(os.path.join(self.build_config_dir, 'config_freebsd'))
+            self.compiler.add_library('kvm')
         elif sys.platform.startswith('dragonfly'):
             self.add_include_dir(os.path.join(self.build_config_dir, 'config_freebsd'))
         elif sys.platform.startswith('netbsd'):
