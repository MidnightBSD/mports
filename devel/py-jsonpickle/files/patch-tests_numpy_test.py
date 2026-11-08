--- tests/numpy_test.py.orig
+++ tests/numpy_test.py
@@ -194,13 +194,35 @@
     warn_count = 1
     with warnings.catch_warnings(record=True) as w:
         _a = roundtrip(a)
-        assert len(w) == warn_count
+        assert len(w) == warn_count + 2
+        deprecations = [warning for warning in w if warning.category is DeprecationWarning]
+        assert len(deprecations) == 2
+        assert all(str(warning.message) == "keys will default to True in jsonpickle 5.0.0"
+                   for warning in deprecations)
+        array_warnings = [warning for warning in w if warning.category is UserWarning]
+        assert len(array_warnings) == warn_count
+        assert all(str(warning.message) == (
+            "ndarray is defined by reference to an object "
+            "we do not know how to serialize. "
+            "A deep copy is serialized instead, breaking memory aliasing."
+        ) for warning in array_warnings)
         npt.assert_array_equal(a, _a)
 
     # this also requires a deepcopy to work
     with warnings.catch_warnings(record=True) as w:
         _a, _b = roundtrip([a, b])
-        assert len(w) == warn_count
+        assert len(w) == warn_count + 2
+        deprecations = [warning for warning in w if warning.category is DeprecationWarning]
+        assert len(deprecations) == 2
+        assert all(str(warning.message) == "keys will default to True in jsonpickle 5.0.0"
+                   for warning in deprecations)
+        array_warnings = [warning for warning in w if warning.category is UserWarning]
+        assert len(array_warnings) == warn_count
+        assert all(str(warning.message) == (
+            "ndarray is defined by reference to an object "
+            "we do not know how to serialize. "
+            "A deep copy is serialized instead, breaking memory aliasing."
+        ) for warning in array_warnings)
         npt.assert_array_equal(a, _a)
         npt.assert_array_equal(b, _b)
 
@@ -245,7 +267,18 @@
     warn_count = 1
     with warnings.catch_warnings(record=True) as w:
         _a, _b = roundtrip([a, b])
-        assert len(w) == warn_count
+        assert len(w) == warn_count + 2
+        deprecations = [warning for warning in w if warning.category is DeprecationWarning]
+        assert len(deprecations) == 2
+        assert all(str(warning.message) == "keys will default to True in jsonpickle 5.0.0"
+                   for warning in deprecations)
+        array_warnings = [warning for warning in w if warning.category is UserWarning]
+        assert len(array_warnings) == warn_count
+        assert all(str(warning.message) == (
+            "ndarray is defined by reference to an object "
+            "we do not know how to serialize. "
+            "A deep copy is serialized instead, breaking memory aliasing."
+        ) for warning in array_warnings)
         npt.assert_array_equal(a, _a)
         npt.assert_array_equal(b, _b)
 
@@ -265,7 +298,18 @@
     with warnings.catch_warnings(record=True) as w:
         _a = roundtrip(a)
         npt.assert_array_equal(a, _a)
-        assert len(w) == warn_count
+        assert len(w) == warn_count + 2
+        deprecations = [warning for warning in w if warning.category is DeprecationWarning]
+        assert len(deprecations) == 2
+        assert all(str(warning.message) == "keys will default to True in jsonpickle 5.0.0"
+                   for warning in deprecations)
+        array_warnings = [warning for warning in w if warning.category is UserWarning]
+        assert len(array_warnings) == warn_count
+        assert all(str(warning.message) == (
+            "ndarray is defined by reference to an object "
+            "we do not know how to serialize. "
+            "A deep copy is serialized instead, breaking memory aliasing."
+        ) for warning in array_warnings)
 
 
 def test_as_strided():
@@ -285,7 +329,18 @@
         # currently serialize correctly FIXME: would be neat to add
         # support for all objects implementing the __array_interface__
         _data = roundtrip(data)
-        assert len(w) == warn_count
+        assert len(w) == warn_count + 2
+        deprecations = [warning for warning in w if warning.category is DeprecationWarning]
+        assert len(deprecations) == 2
+        assert all(str(warning.message) == "keys will default to True in jsonpickle 5.0.0"
+                   for warning in deprecations)
+        array_warnings = [warning for warning in w if warning.category is UserWarning]
+        assert len(array_warnings) == warn_count
+        assert all(str(warning.message) == (
+            "ndarray is defined by reference to an object "
+            "we do not know how to serialize. "
+            "A deep copy is serialized instead, breaking memory aliasing."
+        ) for warning in array_warnings)
 
     # as we were warned, deserialized result is no longer a view
     _data[0][0] = -1
