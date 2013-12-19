--- utils/llvm-build/llvmbuild/main.py.orig	2013-01-02 04:10:48.000000000 -0500
+++ utils/llvm-build/llvmbuild/main.py	2013-12-18 22:30:22.855381879 -0500
@@ -652,7 +652,10 @@
 
     # We handle a few special cases of target names here for historical
     # reasons, as these are the names configure currently comes up with.
-    native_target_name = { 'x86' : 'X86',
+    native_target_name = { 'amd64' : 'X86',
+			   'i386' : 'X86',
+			   'sparc64' : 'Sparc',
+                           'x86' : 'X86',
                            'x86_64' : 'X86',
                            'Unknown' : None }.get(opts.native_target,
                                                   opts.native_target)
