--- psutil/_common.py.orig	2020-09-18 15:14:17.791076000 -0400
+++ psutil/_common.py	2020-09-18 15:16:37.658228000 -0400
@@ -45,7 +45,7 @@
 __all__ = [
     # OS constants
     'FREEBSD', 'BSD', 'LINUX', 'NETBSD', 'OPENBSD', 'MACOS', 'OSX', 'POSIX',
-    'SUNOS', 'WINDOWS',
+    'SUNOS', 'WINDOWS', 'MIDNIGHTBSD',
     # connection constants
     'CONN_CLOSE', 'CONN_CLOSE_WAIT', 'CONN_CLOSING', 'CONN_ESTABLISHED',
     'CONN_FIN_WAIT1', 'CONN_FIN_WAIT2', 'CONN_LAST_ACK', 'CONN_LISTEN',
@@ -83,7 +83,7 @@
 LINUX = sys.platform.startswith("linux")
 MACOS = sys.platform.startswith("darwin")
 OSX = MACOS  # deprecated alias
-FREEBSD = sys.platform.startswith("freebsd")
+FREEBSD = sys.platform.startswith("freebsd") or sys.platform.startswith("midnightbsd")
 OPENBSD = sys.platform.startswith("openbsd")
 NETBSD = sys.platform.startswith("netbsd")
 BSD = FREEBSD or OPENBSD or NETBSD
