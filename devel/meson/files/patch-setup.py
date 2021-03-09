--- setup.py.orig	2021-01-06 10:39:48 UTC
+++ setup.py
@@ -40,7 +40,7 @@ packages = ['mesonbuild',
 data_files = []
 if sys.platform != 'win32':
     # Only useful on UNIX-like systems
-    data_files = [('share/man/man1', ['man/meson.1']),
+    data_files = [('man/man1', ['man/meson.1']),
                   ('share/polkit-1/actions', ['data/com.mesonbuild.install.policy'])]
 
 if __name__ == '__main__':
