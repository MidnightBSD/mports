--- setup.py.orig	2025-09-15 20:54:46 UTC
+++ setup.py
@@ -64,12 +64,15 @@ elif platform.startswith('freebsd'):
     platform = 'linux'
 elif platform.startswith('freebsd'):
     platform = 'freebsd'
+elif platform.startswith('midnightbsd'):
+    platform = 'midnightbsd'
 
 
 CONFIGURE_WITH_ICU_CONFIG = {
     'darwin': False,
     'linux': True,
     'freebsd': False, # not tested
+    'midnightbsd': False,
     'win32': False,   # no icu-config
     'sunos5': False,  # not tested
     'cygwin': False,  # not tested
@@ -79,6 +82,7 @@ CONFIGURE_WITH_PKG_CONFIG = {
     'darwin': False,  # no pkg-config ?
     'linux': True,
     'freebsd': False, # not tested
+    'midnightbsd': False, # not tested
     'win32': False,   # no pkg-config ?
     'sunos5': False,  # not tested
     'cygwin': False,  # not tested
@@ -111,6 +115,7 @@ INCLUDES = {
     'darwin': [],
     'linux': [],
     'freebsd': ['/usr/local/include'],
+    'midnightbsd': ['/usr/local/include'],
     'win32': ['c:/icu/include'],
     'sunos5': [],
     'cygwin': [],
@@ -129,6 +134,7 @@ PEDANTIC_FLAGS = {
     'darwin': ['-pedantic'],
     'linux': ['-pedantic', '-Wno-variadic-macros'],
     'freebsd': ['-pedantic'],
+    'midnightbsd': ['-pedantic'],
     'win32': [],
     'sunos5': [],
     'cygwin': ['-pedantic'],
@@ -138,6 +144,7 @@ CFLAGS = {
     'darwin': ['-std=c++17'],
     'linux': ['-std=c++17'],
     'freebsd': ['-std=c++17'],
+    'midnightbsd': ['-std=c++17'],
     'win32': ['/Zc:wchar_t', '/EHsc'],
     'sunos5': ['-std=c++17'],
     'cygwin': ['-D_GNU_SOURCE=1', '-std=c++17'],
@@ -148,6 +155,7 @@ DEBUG_CFLAGS = {
     'darwin': ['-O0', '-g', '-DDEBUG'],
     'linux': ['-O0', '-g', '-DDEBUG'],
     'freebsd': ['-O0', '-g', '-DDEBUG'],
+    'midnightbsd': ['-O0', '-g', '-DDEBUG'],
     'win32': ['/Od', '/DDEBUG'],
     'sunos5': ['-DDEBUG'],
     'cygwin': ['-Og', '-g', '-DDEBUG'],
@@ -157,6 +165,7 @@ LFLAGS = {
     'darwin': [],
     'linux': [],
     'freebsd': ['-L/usr/local/lib'],
+    'midnightbsd': ['-L/usr/local/lib'],
     'win32': ['/LIBPATH:c:/icu/lib'],
     'sunos5': [],
     'cygwin': [],
@@ -166,6 +175,7 @@ LIBRARIES = {
     'darwin': [],
     'linux': [],
     'freebsd': ['icui18n', 'icuuc', 'icudata'],
+    'midnightbsd': ['icui18n', 'icuuc', 'icudata'],
     'win32': ['icuin', 'icuuc', 'icudt'],
     'sunos5': ['icui18n', 'icuuc', 'icudata'],
     'cygwin': ['icui18n', 'icuuc', 'icudata'],
