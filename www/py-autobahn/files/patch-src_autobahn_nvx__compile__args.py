--- src/autobahn/nvx/_compile_args.py.orig
+++ src/autobahn/nvx/_compile_args.py
@@ -292,6 +292,10 @@ def _get_safe_march_flag(machine):
         Safe -march flag for the architecture, or None for unknown architectures.
     """
     if machine in ("x86_64", "amd64", "x64"):
+        if sys.platform.startswith("midnightbsd"):
+            # Respect the ports tree's selected amd64 CPU baseline.
+            return None
+
         # x86-64: Use microarchitecture level 2 (2009+ CPUs)
