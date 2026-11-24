--- src/autobahn/nvx/test/test_compile_args.py.orig
+++ src/autobahn/nvx/test/test_compile_args.py
@@ -41,6 +41,7 @@ class TestSafeMarchFlag(unittest.TestCase):
     """Architecture -> safe -march flag mapping (#1834, #1717)."""
 
     def test_x86_64_variants(self):
+        expected = None if sys.platform.startswith("midnightbsd") else "-march=x86-64-v2"
         for machine in ("x86_64", "amd64", "x64"):
-            self.assertEqual(_get_safe_march_flag(machine), "-march=x86-64-v2")
+            self.assertEqual(_get_safe_march_flag(machine), expected)
