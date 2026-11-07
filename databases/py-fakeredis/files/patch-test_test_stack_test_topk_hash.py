--- /dev/null
+++ test/test_stack/test_topk_hash.py
@@ -0,0 +1,27 @@
+import pytest
+
+from fakeredis.model._topk import HeavyKeeper, _murmurhash2
+
+
+@pytest.mark.parametrize(
+    ("item", "expected"),
+    [
+        (b"", [0, 1540447798, 3080895597, 1250256608]),
+        (b"a", [2456313694, 626045324, 754329161, 4064081175]),
+        (b"abc", [324500635, 1621425345, 3876204518, 3632428247]),
+        (b"abcd", [646393889, 3376380438, 24344973, 2176146243]),
+        (b"abcde", [1594468574, 3469237630, 909959494, 944798701]),
+        (b"\x00\xff\x00", [3520251464, 2643883105, 794297691, 356541971]),
+    ],
+)
+def test_murmurhash2_native_vectors(item, expected):
+    assert [_murmurhash2(item, seed) for seed in (0, 1, 2, 1919)] == expected
+
+
+def test_topk_row_hashes_and_increments():
+    topk = HeavyKeeper(3, 10, 3, 1)
+    assert [row._hash(b"bar") % 10 for row in topk.hash_arrays] == [1, 3, 3]
+    assert [row._hash(b"42") % 10 for row in topk.hash_arrays] == [6, 4, 3]
+    for item, count in ((b"bar", 3), (b"baz", 6), (b"42", 4), (b"42", 8), (b"xyzzy", 4)):
+        topk.add(item, count)
+    assert [topk.count(item) for item in (b"bar", b"baz", b"42", b"xyzzy")] == [3, 6, 12, 4]
