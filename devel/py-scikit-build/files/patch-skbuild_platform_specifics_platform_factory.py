--- skbuild/platform_specifics/platform_factory.py.orig	2020-02-02 00:00:00 UTC
+++ skbuild/platform_specifics/platform_factory.py
@@ -35,6 +35,11 @@
 
         return osx.OSXPlatform()
 
+    if this_platform == "midnightbsd":
+        from . import bsd  # noqa: PLC0415
+
+        return bsd.MidnightBSDPlatform()
+
     if this_platform in {"freebsd", "netbsd", "os400", "openbsd"}:
         from . import bsd  # noqa: PLC0415
 
