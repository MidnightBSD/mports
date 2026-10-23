--- src/watchdog/utils/platform.py.orig	2024-11-01 14:03:25 UTC
+++ src/watchdog/utils/platform.py
@@ -19,7 +19,7 @@ def get_platform_name() -> str:
     if sys.platform.startswith("linux"):
         return PLATFORM_LINUX
 
-    if sys.platform.startswith(("dragonfly", "freebsd", "netbsd", "openbsd", "bsd")):
+    if sys.platform.startswith(("dragonfly", "freebsd", "midnightbsd", "netbsd", "openbsd", "bsd")):
         return PLATFORM_BSD
 
     return PLATFORM_UNKNOWN
