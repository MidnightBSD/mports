--- tests/test_eigen_tensor.py.orig
+++ tests/test_eigen_tensor.py
@@ -137,3 +137,19 @@
     d_cast = t.castTo0dTensorMap(d)
     assert_array_equal(d_cast, d)
     assert not d_cast.flags.owndata
+
+
+@needs_numpy_and_eigen
+def test_zero_size_aligned_map_with_unaligned_pointer():
+    storage = np.empty(64, dtype=np.uint8)
+    offset = (-storage.ctypes.data) % 16 + 4
+    empty = np.ndarray((0, 2, 4), dtype=np.int32, buffer=storage,
+                       offset=offset, order='F')
+    assert empty.ctypes.data % 16 == 4
+    assert_array_equal(t.castTo3iTensorMapAligned(empty), empty)
+
+    nonempty = np.ndarray((1, 2, 4), dtype=np.int32, buffer=storage,
+                          offset=offset, order='F')
+    assert nonempty.ctypes.data % 16 == 4
+    with pytest.raises(RuntimeError, match='bad_cast'):
+        t.castTo3iTensorMapAligned(nonempty)
