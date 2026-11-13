--- tests/jsonpickle_test.py.orig
+++ tests/jsonpickle_test.py
@@ -719,7 +719,9 @@
     data = os.fdopen(os.pipe()[0])
     with warnings.catch_warnings(record=True) as w:
         jsonpickle.encode(data, warn=True)
-        assert len(w) == 1
+        assert len(w) == 2
+        assert w[0].category is DeprecationWarning
+        assert str(w[0].message) == "keys will default to True in jsonpickle 5.0.0"
         assert issubclass(w[-1].category, UserWarning)
         assert "replaced with None" in str(w[-1].message)
 
