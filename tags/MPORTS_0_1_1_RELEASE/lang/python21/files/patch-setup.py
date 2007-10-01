--- setup.py.orig	Thu Dec 27 16:51:02 2001
+++ setup.py	Tue Oct 31 18:52:34 2006
@@ -14,7 +14,7 @@
 from distutils.command.build_ext import build_ext
 
 # This global variable is used to hold the list of modules to be disabled.
-disabled_module_list = []
+disabled_module_list = ["_tkinter", "gdbm", "mpz", "pyexpat"]
 
 def find_file(filename, std_dirs, paths):
     """Searches for the directory where a given file is located,
@@ -119,9 +119,9 @@
         # compilers
         if compiler is not None:
             (ccshared,) = sysconfig.get_config_vars('CCSHARED')
-            args['compiler_so'] = compiler + ' ' + ccshared
+            args['compiler_so'] = compiler + ' ' + ccshared 
         if linker_so is not None:
-            args['linker_so'] = linker_so + ' -shared'
+            args['linker_so'] = linker_so + ' -shared'
         self.compiler.set_executables(**args)
 
         build_ext.build_extensions(self)
@@ -609,7 +609,7 @@
           ext_modules=[Extension('struct', ['structmodule.c'])],
 
           # Scripts to install
-          scripts = ['Tools/scripts/pydoc']
+          scripts = []
         )
 
 # --install-platlib
