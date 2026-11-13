--- tests/expr_and_series/arithmetic_test.py.orig
+++ tests/expr_and_series/arithmetic_test.py
@@ -11,6 +11,7 @@ from tests.utils import (
     DASK_VERSION,
     DUCKDB_VERSION,
     PANDAS_VERSION,
+    POLARS_VERSION,
     Constructor,
     ConstructorEager,
     assert_equal_data,
@@ -146,7 +147,7 @@ def test_arithmetic_series(
 def test_truediv_same_dims(
     constructor_eager: ConstructorEager, request: pytest.FixtureRequest
 ) -> None:
-    if "polars" in str(constructor_eager):
+    if "polars" in str(constructor_eager) and POLARS_VERSION < (2, 1):
         # https://github.com/pola-rs/polars/issues/17760
         request.applymarker(pytest.mark.xfail)
     s_left = nw.from_native(constructor_eager({"a": [1, 2, 3]}), eager_only=True)["a"]
