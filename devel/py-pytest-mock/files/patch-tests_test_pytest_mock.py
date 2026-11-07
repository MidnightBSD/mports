--- tests/test_pytest_mock.py
+++ tests/test_pytest_mock.py
@@ -657,14 +657,19 @@
         # this may be a bit too assuming, but seems nicer then hard-coding
         import _pytest.assertion.util as util
 
+        if not hasattr(util, "_compare_eq_iterable"):
+            from _pytest.assertion._compare_sequence import _compare_eq_iterable
+        else:
+            _compare_eq_iterable = util._compare_eq_iterable
+
         # NOTE: we assert with either verbose or not, depending on how our own
         #       test was run by examining sys.argv
         verbose = any(a.startswith("-v") for a in sys.argv)
         if int(pytest.__version__.split(".")[0]) < 8:
-            expected = "\n  ".join(util._compare_eq_iterable(left, right, verbose))  # type:ignore[arg-type]
+            expected = "\n  ".join(_compare_eq_iterable(left, right, verbose))  # type:ignore[arg-type]
         else:
             expected = "\n  ".join(
-                util._compare_eq_iterable(left, right, lambda t, *_, **__: t, verbose)  # type:ignore[arg-type]
+                _compare_eq_iterable(left, right, lambda t, *_, **__: t, verbose)  # type:ignore[arg-type]
             )
         assert expected in str(e)
     else:
