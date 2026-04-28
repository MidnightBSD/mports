--- testing/mozbase/mozinfo/mozinfo/mozinfo.py.orig	2025-01-01 00:00:00.000000000 +0000
+++ testing/mozbase/mozinfo/mozinfo/mozinfo.py
@@ -94,7 +94,7 @@
     info["os"] = "linux"
     info["linux_distro"] = distribution
-elif system in ["DragonFly", "FreeBSD", "NetBSD", "OpenBSD"]:
+elif system in ["DragonFly", "FreeBSD", "MidnightBSD", "NetBSD", "OpenBSD"]:
     info["os"] = "bsd"  # community builds
     version = os_version = sys.platform
 elif system == "Darwin":
