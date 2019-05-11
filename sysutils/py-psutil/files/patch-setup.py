--- setup.py.orig	2019-05-11 12:44:15.153319000 -0400
+++ setup.py	2019-05-11 12:48:27.184364000 -0400
@@ -254,8 +254,18 @@
         define_macros=macros)
 
 else:
-    sys.exit('platform %s is not supported' % sys.platform)
-
+    macros.append(("PSUTIL_BSD", 1))
+    macros.append(("PSUTIL_FREEBSD", 1))
+    ext = Extension(
+        'psutil._psutil_bsd',
+        sources=sources + [
+            'psutil/_psutil_bsd.c',
+            'psutil/arch/freebsd/specific.c',
+            'psutil/arch/freebsd/sys_socks.c',
+            'psutil/arch/freebsd/proc_socks.c',
+        ],
+        define_macros=macros,
+        libraries=["devstat"])
 
 if POSIX:
     posix_extension = Extension(
