--- setup.py.orig
+++ setup.py
@@ -210,7 +210,7 @@
 
         if sys.platform.startswith('linux'):
             self.compiler.add_library('rt')
-        elif sys.platform.startswith(('freebsd', 'dragonfly')):
+        elif sys.platform.startswith(('freebsd', 'dragonfly', 'midnightbsd')):
             self.compiler.add_library('kvm')
         elif sys.platform.startswith('sunos'):
             self.compiler.add_library('kstat')
