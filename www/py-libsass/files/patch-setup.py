--- setup.py.orig	2018-12-01 15:27:12 UTC
+++ setup.py
@@ -18,6 +18,6 @@ MACOS_FLAG = ['-mmacosx-version-min=10.7']
 FLAGS_POSIX = [
     '-fPIC', '-std=gnu++0x', '-Wall', '-Wno-parentheses', '-Werror=switch',
 ]
-FLAGS_CLANG = ['-c', '-O3'] + FLAGS_POSIX + ['-stdlib=libc++']
+FLAGS_CLANG = ['-c'] + FLAGS_POSIX
 LFLAGS_POSIX = ['-fPIC',  '-lstdc++']
-LFLAGS_CLANG = ['-fPIC', '-stdlib=libc++']
+LFLAGS_CLANG = ['-fPIC']
@@ -52,5 +52,7 @@ if os.environ.get('SYSTEM_SASS', False):
 if os.environ.get('SYSTEM_SASS', False):
     libraries = ['sass']
     include_dirs = []
+    extra_compile_args = [arg for arg in extra_compile_args if arg != '-std=gnu++0x']
+    extra_link_args = [arg for arg in extra_link_args if arg != '-lstdc++']
 else:
     LIBSASS_SOURCE_DIR = os.path.join('libsass', 'src')
