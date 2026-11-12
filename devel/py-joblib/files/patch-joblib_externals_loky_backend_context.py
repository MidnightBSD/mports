--- joblib/externals/loky/backend/context.py.orig
+++ joblib/externals/loky/backend/context.py
@@ -262,8 +262,14 @@
             cpu_count_physical = _count_physical_cores_win32()
         elif sys.platform == "darwin":
             cpu_count_physical = _count_physical_cores_darwin()
-        elif sys.platform.startswith("freebsd"):
+        elif sys.platform.startswith(("freebsd", "midnightbsd")):
             cpu_count_physical = _count_physical_cores_freebsd()
+        elif sys.platform.startswith("netbsd"):
+            # Preserve the existing NetBSD fallback; hw.ncpu includes SMT threads.
+            cpu_info = subprocess.run(
+                "sysctl -n hw.ncpu".split(), capture_output=True, text=True
+            )
+            cpu_count_physical = int(cpu_info.stdout)
         else:
             raise NotImplementedError(f"unsupported platform: {sys.platform}")
