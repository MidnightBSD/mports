--- ffi/build.py.orig
+++ ffi/build.py
@@ -219,7 +219,7 @@
 
 
 def main():
-    ELF_systems = ('linux', 'gnu', 'freebsd', 'openbsd', 'netbsd')
+    ELF_systems = ('linux', 'gnu', 'freebsd', 'openbsd', 'netbsd', 'midnightbsd')
     if sys.platform == 'win32':
         main_windows()
     elif sys.platform.startswith(ELF_systems):
