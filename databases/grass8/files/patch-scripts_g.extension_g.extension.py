--- scripts/g.extension/g.extension.py.orig	2026-10-22 22:00:52 UTC
+++ scripts/g.extension/g.extension.py
@@ -193,7 +193,7 @@ GIT_URL = "https://github.com/OSGeo/grass-addons/"
 # GRASS Makefile are type of GNU Make and not BSD Make
 # On FreeBSD (and other BSD and maybe unix) we have to
 # use GNU Make program often "gmake" to distinct with the (bsd) "make"
-if sys.platform.startswith("freebsd"):
+if sys.platform.startswith(("freebsd", "midnightbsd")):
     MAKE = "gmake"
 else:
     MAKE = "make"
