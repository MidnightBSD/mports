--- testing/mozbase/mozinfo/mozinfo/mozinfo.py.orig	2023-05-01 16:47:01.012011000 -0400
+++ testing/mozbase/mozinfo/mozinfo/mozinfo.py	2023-05-01 16:47:13.825356000 -0400
@@ -133,7 +133,7 @@
 
     info["os"] = "linux"
     info["linux_distro"] = distribution
-elif system in ["DragonFly", "FreeBSD", "NetBSD", "OpenBSD"]:
+elif system in ["DragonFly", "FreeBSD", "NetBSD", "OpenBSD", "MidnightBSD"]:
     info["os"] = "bsd"
     version = os_version = sys.platform
 elif system == "Darwin":
