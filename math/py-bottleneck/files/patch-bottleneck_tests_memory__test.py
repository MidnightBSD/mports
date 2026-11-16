--- bottleneck/tests/memory_test.py.orig	2025-09-08 16:21:25 UTC
+++ bottleneck/tests/memory_test.py
@@ -34,3 +34,24 @@
     print(diff_bytes)
     # For 1.3.0 release, this had value of ~100kB
     assert diff_bytes == 0
+
+
+@pytest.mark.thread_unsafe
+@pytest.mark.parametrize(
+    "func, arr, output_dtype",
+    [
+        (bn.nanmin, np.zeros((4, 0), dtype=np.float64), np.float64),
+        (bn.nanmax, np.zeros((4, 0), dtype=np.int64), np.int64),
+        (bn.nanargmin, np.zeros((4, 0), dtype=np.float64), np.intp),
+        (bn.nanargmax, np.zeros((4, 0), dtype=np.int64), np.intp),
+        (bn.nanargmin, np.full((4, 2), np.nan), np.intp),
+        (bn.nanargmax, np.full((4, 2), np.nan), np.intp),
+    ],
+)
+def test_reducer_error_path_refcount(func, arr, output_dtype):
+    dtype = np.dtype(output_dtype)
+    before = sys.getrefcount(dtype)
+    for _ in range(1000):
+        with pytest.raises(ValueError):
+            func(arr, axis=1)
+    assert sys.getrefcount(dtype) == before
