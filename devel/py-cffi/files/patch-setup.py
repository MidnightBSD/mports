--- setup.py.orig
+++ setup.py
@@ -167,6 +167,10 @@
 if 'freebsd' in sys.platform:
     include_dirs.append('/usr/local/include')
     library_dirs.append('/usr/local/lib')

+if 'midnightbsd' in sys.platform:
+    include_dirs.append('/usr/local/include')
+    library_dirs.append('/usr/local/lib')
+
 if 'darwin' in sys.platform:
     try:
         p = subprocess.Popen(['xcrun', '--show-sdk-path'],
