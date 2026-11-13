--- test/test_stack/test_tdigest.py.orig
+++ test/test_stack/test_tdigest.py
@@ -152,7 +152,9 @@
 
 def test_tdigest_quantile_nan(r: redis.Redis):
     r.tdigest().create("foo")
-    r.tdigest().add("foo", [123])
+    empty = r.tdigest().quantile("foo", 0, 0.9, 1)
+    assert len(empty) == 3
+    assert all(math.isnan(float(value)) for value in empty)
     res = r.tdigest().quantile("foo", 0.9)
     assert isinstance(res, list)
     assert len(res) == 1
@@ -163,6 +165,28 @@
 
     res = r.tdigest().quantile("foo", 1)[0]
     assert math.isnan(float(res)), f"Expected NaN, got {res}"
+
+
+@pytest.mark.parametrize("value", [123.0, -7.25, 0.0])
+def test_tdigest_quantile_single_value(r: redis.Redis, value: float):
+    r.tdigest().create("foo")
+    r.tdigest().add("foo", [value])
+    res = r.tdigest().quantile("foo", 0, 0.9, 1)
+    assert isinstance(res, list)
+    assert len(res) == 3
+    assert [float(v) for v in res] == [value, value, value]
+    for q in (0, 0.9, 1):
+        assert float(r.tdigest().quantile("foo", q)[0]) == value
+
+
+@pytest.mark.parametrize("populated", [False, True])
+@pytest.mark.parametrize("q", [-0.1, 1.1])
+def test_tdigest_quantile_bounds(r: redis.Redis, populated: bool, q: float):
+    r.tdigest().create("foo")
+    if populated:
+        r.tdigest().add("foo", [123])
+    with pytest.raises((redis.ResponseError, valkey.ResponseError), match="quantile should be in"):
+        r.tdigest().quantile("foo", q)
 
 
 @pytest.mark.supported_server_versions(min_redis_ver="7")
