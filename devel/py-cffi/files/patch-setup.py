--- setup.py.orig	2020-03-01 16:40:04.925109000 -0500
+++ setup.py	2020-03-01 16:40:34.999495000 -0500
@@ -153,6 +153,10 @@
     include_dirs.append('/usr/local/include')
     library_dirs.append('/usr/local/lib')
 
+if 'midnightbsd' in sys.platform:
+    include_dirs.append('/usr/local/include')
+    library_dirs.append('/usr/local/lib')
+
 if 'darwin' in sys.platform:
     try:
         p = subprocess.Popen(['xcrun', '--show-sdk-path'],
