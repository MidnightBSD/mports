--- v8/tools/metagen/compile_flags.py.orig	2026-10-30 03:33:22 UTC
+++ v8/tools/metagen/compile_flags.py
@@ -104,6 +104,8 @@
   (s390x, ppc64, z/OS); there a system gn on PATH is the only one, which
   is what tools/mb/mb.py falls back to on the same hosts."""
   exe = "gn.exe" if sys.platform == "win32" else "gn"
+  if sys.platform.startswith(("freebsd", "midnightbsd")):
+    return shutil.which("gn")
   if sys.platform == "darwin":
     # Both Mac arches: the arch is in the CIPD package name, not the dir.
     plats = ("mac",)
