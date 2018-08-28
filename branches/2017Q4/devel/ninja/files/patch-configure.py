--- configure.py.orig	2014-11-24 18:37:47.000000000 +0100
+++ configure.py	2015-01-18 21:26:42.000000000 +0100
@@ -164,7 +164,7 @@
         """Run a subcommand, quietly.  Prints the full command on error."""
         try:
             subprocess.check_call(cmdline, shell=True)
-        except subprocess.CalledProcessError, e:
+        except subprocess.CalledProcessError:
             print('when running: ', cmdline)
             raise
 
@@ -297,7 +297,7 @@
         cflags += ['/Ox', '/DNDEBUG', '/GL']
         ldflags += ['/LTCG', '/OPT:REF', '/OPT:ICF']
 else:
-    cflags = ['-g', '-Wall', '-Wextra',
+    cflags = ['-Wall', '-Wextra',
               '-Wno-deprecated',
               '-Wno-unused-parameter',
               '-fno-rtti',
