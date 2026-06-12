--- cargo-crates/v8-149.2.0/build/config/linux/pkg-config.py.orig	2006-07-23 21:21:28.000000000 -0400
+++ cargo-crates/v8-149.2.0/build/config/linux/pkg-config.py	2026-06-11 00:37:19.123528000 -0400
@@ -125,7 +125,7 @@
   # If this is run on non-Linux platforms, just return nothing and indicate
   # success. This allows us to "kind of emulate" a Linux build from other
   # platforms.
-  if "linux" not in sys.platform:
+  if not sys.platform.startswith(tuple(["linux", "openbsd", "freebsd"])):
     if options.dridriverdir or options.libdir:
       sys.stdout.write("")
       return 0
