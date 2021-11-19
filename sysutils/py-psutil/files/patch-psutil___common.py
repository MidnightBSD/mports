--- psutil/_common.py.orig	2021-11-19 18:03:16 UTC
+++ psutil/_common.py
@@ -83,7 +83,7 @@ WINDOWS = os.name == "nt"
 LINUX = sys.platform.startswith("linux")
 MACOS = sys.platform.startswith("darwin")
 OSX = MACOS  # deprecated alias
-FREEBSD = sys.platform.startswith("freebsd")
+FREEBSD = sys.platform.startswith(("freebsd", "midnightbsd"))
 OPENBSD = sys.platform.startswith("openbsd")
 NETBSD = sys.platform.startswith("netbsd")
 BSD = FREEBSD or OPENBSD or NETBSD
