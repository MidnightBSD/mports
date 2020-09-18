--- psutil/__init__.py.orig	2020-09-18 15:40:23.544733000 -0400
+++ psutil/__init__.py	2020-09-18 15:43:17.058348000 -0400
@@ -84,6 +84,7 @@
 from ._common import AIX
 from ._common import BSD
 from ._common import FREEBSD  # NOQA
+from ._common import MIDNIGHTBSD  # NOQA
 from ._common import LINUX
 from ._common import MACOS
 from ._common import NETBSD  # NOQA
@@ -160,7 +161,7 @@
 elif MACOS:
     from . import _psosx as _psplatform
 
-elif BSD:
+elif BSD or MIDNIGHTBSD:
     from . import _psbsd as _psplatform
 
 elif SUNOS:
@@ -207,7 +208,7 @@
     "POWER_TIME_UNKNOWN", "POWER_TIME_UNLIMITED",
 
     "BSD", "FREEBSD", "LINUX", "NETBSD", "OPENBSD", "MACOS", "OSX", "POSIX",
-    "SUNOS", "WINDOWS", "AIX",
+    "SUNOS", "WINDOWS", "AIX", "MIDNIGHTBSD",
 
     # classes
     "Process", "Popen",
