--- setup.py.orig
+++ setup.py
@@ -73,7 +73,7 @@
 else:
     use_system_liblz4 = False

-if liblz4_found is True and use_system_liblz4 is True:
+if use_system_liblz4 is True:
     extension_kwargs['libraries'] = ['lz4']
 else:
     extension_kwargs['include_dirs'] = ['lz4libs']
@@ -115,6 +115,12 @@
 elif compiler in ('unix', 'mingw32'):
     if liblz4_found is True and use_system_liblz4 is True:
         extension_kwargs = pkgconfig_parse('liblz4')
+    elif use_system_liblz4 is True:
+        extension_kwargs['extra_compile_args'] = [
+            '-O3',
+            '-Wall',
+            '-Wundef'
+        ]
     else:
         extension_kwargs['extra_compile_args'] = [
             '-O3',
