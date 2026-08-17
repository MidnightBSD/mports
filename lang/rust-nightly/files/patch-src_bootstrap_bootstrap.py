bootstrap.py maps uname(1) output to an LLVM triple and aborts on anything it
does not know:

  unknown OS type: MidnightBSD
  Build completed unsuccessfully in 0:00:00

lang/rust carries the same hunk.

--- src/bootstrap/bootstrap.py.orig	2026-06-21 00:00:00 UTC
+++ src/bootstrap/bootstrap.py
@@ -322,6 +322,7 @@ def default_build_triple(verbose):
     kerneltype_mapper = {
         "Darwin": "apple-darwin",
         "DragonFly": "unknown-dragonfly",
         "FreeBSD": "unknown-freebsd",
+        "MidnightBSD": "unknown-freebsd",
         "Haiku": "unknown-haiku",
         "NetBSD": "unknown-netbsd",
         "OpenBSD": "unknown-openbsd",
