--- tests/hamcrest_unit_test/number/iscloseto_test.py.orig
+++ tests/hamcrest_unit_test/number/iscloseto_test.py
@@ -64,7 +64,7 @@
 class IsNumericTest(unittest.TestCase):
     @unittest.skipUnless(NUMPY_AVAILABLE, "Skipped because it needs NumPy")
     def test_numpy_numeric_type_int(self):
-        self.assertTrue(isnumeric(np.int(1)), "Platform integer (normally either int32 or int64)")
+        self.assertTrue(isnumeric(int(1)), "Platform integer (normally either int32 or int64)")
 
     @unittest.skipUnless(NUMPY_AVAILABLE, "Skipped because it needs NumPy")
     def test_numpy_numeric_type_int8(self):
@@ -102,7 +102,7 @@
 
     @unittest.skipUnless(NUMPY_AVAILABLE, "Skipped because it needs NumPy")
     def test_numpy_numeric_type_float(self):
-        self.assertTrue(isnumeric(np.float(1)), "Shorthand for float64.")
+        self.assertTrue(isnumeric(float(1)), "Shorthand for float64.")
 
     @unittest.skipUnless(NUMPY_AVAILABLE, "Skipped because it needs NumPy")
     def test_numpy_numeric_type_float16(self):
@@ -127,7 +127,7 @@
 
     @unittest.skipUnless(NUMPY_AVAILABLE, "Skipped because it needs NumPy")
     def test_numpy_numeric_type_complex(self):
-        self.assertTrue(isnumeric(np.complex(1)), "Shorthand for complex128.")
+        self.assertTrue(isnumeric(complex(1)), "Shorthand for complex128.")
 
     @unittest.skipUnless(NUMPY_AVAILABLE, "Skipped because it needs NumPy")
     def test_numpy_numeric_type_complex64(self):
