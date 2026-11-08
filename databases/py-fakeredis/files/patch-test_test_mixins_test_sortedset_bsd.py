--- /dev/null
+++ test/test_mixins/test_sortedset_bsd.py
@@ -0,0 +1,19 @@
+import math
+import sys
+
+import pytest
+
+
+@pytest.mark.skipif(
+    not sys.platform.startswith(("freebsd", "midnightbsd")),
+    reason="Redis uses platform libc ordering for equal-cardinality inputs",
+)
+@pytest.mark.parametrize(("numkeys", "expected"), [(7, 1.0), (8, 0.0), (9, 0.0), (10, 0.0)])
+def test_zinterstore_repeated_keys_with_infinite_weight(r, numkeys, expected):
+    r.zadd(b"A", {b"A": 1.0, b"AA": 0.0})
+    r.zadd(b"B", {b"A": 1.0, b"AA": 1.0})
+    keys = [b"A"] * (numkeys - 1) + [b"B"]
+    weights = [0.0] * (numkeys - 2) + [float("inf"), 1.0]
+    assert r.execute_command("ZINTERSTORE", b"A", numkeys, *keys, "WEIGHTS", *weights) == 2
+    assert r.zscore(b"A", b"AA") == expected
+    assert math.isinf(r.zscore(b"A", b"A"))
