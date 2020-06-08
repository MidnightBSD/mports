--- setup.py.orig	2020-06-08 10:16:43.313348000 -0400
+++ setup.py	2020-06-08 10:18:30.236567000 -0400
@@ -82,6 +82,7 @@ CONFIGURE_WITH_ICU_CONFIG = {
     'darwin': True,
     'linux': True,
     'freebsd': False, # not tested
+    'midnightbsd': False,
     'win32': False,   # no icu-config
     'sunos5': False,  # not tested
     'cygwin': False,  # not tested
@@ -91,6 +92,7 @@ CONFIGURE_WITH_PKG_CONFIG = {
     'darwin': False,  # no pkg-config ?
     'linux': True,
     'freebsd': False, # not tested
+    'midnightbsd': False, # not tested
     'win32': False,   # no pkg-config ?
     'sunos5': False,  # not tested
     'cygwin': False,  # not tested
@@ -100,6 +102,7 @@ INCLUDES = {
     'darwin': [],
     'linux': [],
     'freebsd': ['/usr/local/include'],
+    'midnightbsd': ['/usr/local/include'],
     'win32': ['c:/icu/include'],
     'sunos5': [],
     'cygwin': [],
@@ -109,6 +112,7 @@ VER_FLAGS = {
     'darwin': ['-DPYICU_VER="%s"' %(VERSION)],
     'linux': ['-DPYICU_VER="%s"' %(VERSION)],
     'freebsd': ['-DPYICU_VER="%s"' %(VERSION)],
+    'midnightbsd': ['-DPYICU_VER="%s"' %(VERSION)],
     'win32': ['/DPYICU_VER=\\"%s\\"' %(VERSION)],
     'sunos5': ['-DPYICU_VER="%s"' %(VERSION)],
     'cygwin': ['-DPYICU_VER="%s"' %(VERSION)],
@@ -118,6 +122,7 @@ CFLAGS = {
     'darwin': [],
     'linux': [],
     'freebsd': ['-std=c++11'],
+    'midnightbsd': ['-std=c++11'],
     'win32': ['/Zc:wchar_t', '/EHsc'],
     'sunos5': ['-std=c++11'],
     'cygwin': ['-D_GNU_SOURCE=1', '-std=c++11'],
@@ -128,6 +133,7 @@ DEBUG_CFLAGS = {
     'darwin': ['-O0', '-g', '-DDEBUG'],
     'linux': ['-O0', '-g', '-DDEBUG'],
     'freebsd': ['-O0', '-g', '-DDEBUG'],
+    'midnightbsd': ['-O0', '-g', '-DDEBUG'],
     'win32': ['/Od', '/DDEBUG'],
     'sunos5': ['-DDEBUG'],
     'cygwin': ['-Og', '-g', '-DDEBUG'],
@@ -137,6 +143,7 @@ LFLAGS = {
     'darwin': [],
     'linux': [],
     'freebsd': ['-L/usr/local/lib'],
+    'midnightbsd': ['-L/usr/local/lib'],
     'win32': ['/LIBPATH:c:/icu/lib'],
     'sunos5': [],
     'cygwin': [],
@@ -146,6 +153,7 @@ LIBRARIES = {
     'darwin': [],
     'linux': [],
     'freebsd': ['icui18n', 'icuuc', 'icudata'],
+    'midnightbsd': ['icui18n', 'icuuc', 'icudata'],
     'win32': ['icuin', 'icuuc', 'icudt'],
     'sunos5': ['icui18n', 'icuuc', 'icudata'],
     'cygwin': ['icui18n', 'icuuc', 'icudata'],
@@ -156,6 +164,8 @@ if platform.startswith(('linux', 'gnu'))
     platform = 'linux'
 elif platform.startswith('freebsd'):
     platform = 'freebsd'
+elif platform.startswith('midnightbsd'):
+    platform = 'midnightbsd'
 
 if 'PYICU_INCLUDES' in os.environ:
     _includes = os.environ['PYICU_INCLUDES'].split(os.pathsep)
