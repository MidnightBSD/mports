--- setup.py.orig	Fri Nov 17 17:14:23 2006
+++ setup.py	Fri Nov 17 17:20:53 2006
@@ -15,7 +15,7 @@
 from distutils.command.install_lib import install_lib
 
 # This global variable is used to hold the list of modules to be disabled.
-disabled_module_list = []
+disabled_module_list = ["_bsddb", "_tkinter", "gdbm", "mpz"]
 
 def add_dir_to_list(dirlist, dir):
     """Add the directory 'dir' to the list 'dirlist' (at the front) if
@@ -425,7 +425,7 @@
         if self.compiler.find_library_file(lib_dirs, 'readline'):
             readline_libs = ['readline']
             if self.compiler.find_library_file(lib_dirs,
-                                                 'ncursesw'):
+                                                 'xxxncursesw'):
                 readline_libs.append('ncursesw')
             elif self.compiler.find_library_file(lib_dirs,
                                                  'ncurses'):
@@ -681,7 +681,7 @@
 
         # Curses support, requiring the System V version of curses, often
         # provided by the ncurses library.
-        if (self.compiler.find_library_file(lib_dirs, 'ncursesw')):
+        if (self.compiler.find_library_file(lib_dirs, 'xxxncursesw')):
             curses_libs = ['ncursesw']
             exts.append( Extension('_curses', ['_cursesmodule.c'],
                                    libraries = curses_libs) )
@@ -802,8 +802,7 @@
             # Linux-specific modules
             exts.append( Extension('linuxaudiodev', ['linuxaudiodev.c']) )
 
-        if platform in ('linux2', 'freebsd4', 'freebsd5', 'freebsd6',
-                        'freebsd7'):
+        if platform in ('linux2', 'midnightbsd0', 'freebsd4', 'freebsd5', 'freebsd6', 'freebsd7'):
             exts.append( Extension('ossaudiodev', ['ossaudiodev.c']) )
 
         if platform == 'sunos5':
