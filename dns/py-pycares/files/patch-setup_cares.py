--- setup_cares.py.orig	2020-06-22 17:45:31.557407000 -0400
+++ setup_cares.py	2020-06-22 17:45:57.766282000 -0400
@@ -84,6 +84,9 @@
         elif sys.platform.startswith('freebsd'):
             self.compiler.add_include_dir(os.path.join(self.cares_dir, 'src/config_freebsd'))
             self.compiler.add_library('kvm')
+        elif sys.platform.startswith('midnightbsd'):
+            self.compiler.add_include_dir(os.path.join(self.cares_dir, 'src/config_freebsd'))
+            self.compiler.add_library('kvm')
         elif sys.platform.startswith('dragonfly'):
             self.compiler.add_include_dir(os.path.join(self.cares_dir, 'src/config_freebsd'))
         elif sys.platform.startswith('netbsd'):
