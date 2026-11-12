--- PyInstaller/compat.py.orig
+++ PyInstaller/compat.py
@@ -87,7 +87,7 @@
 is_linux = sys.platform.startswith('linux') or is_android  # For our intents and purposes, Android is also Linux.
 is_solar = sys.platform.startswith('sun')  # Solaris
 is_aix = sys.platform.startswith('aix')
-is_freebsd = sys.platform.startswith('freebsd')
+is_freebsd = sys.platform.startswith(('freebsd', 'midnightbsd'))
 is_openbsd = sys.platform.startswith('openbsd')
 is_netbsd = sys.platform.startswith('netbsd')
 is_hpux = sys.platform.startswith('hp-ux')
@@ -219,7 +219,7 @@
 
 # Cygwin needs special handling, because platform.system() contains identifiers such as MSYS_NT-10.0-19042 and
 # CYGWIN_NT-10.0-19042 that do not fit PyInstaller's OS naming scheme. Explicitly set `system` to 'Cygwin'.
-system = 'Cygwin' if is_cygwin else platform.system()
+system = 'Cygwin' if is_cygwin else 'FreeBSD' if is_freebsd else platform.system()
 # Similarly, fold Android (reported by python >= 3.13 in Termux environment) back into Linux.
 if system == 'Android':
     system = 'Linux'
