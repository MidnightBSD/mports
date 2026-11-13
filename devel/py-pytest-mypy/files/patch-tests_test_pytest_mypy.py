--- tests/test_pytest_mypy.py.orig
+++ tests/test_pytest_mypy.py
@@ -82,6 +82,9 @@
     mypy_status_check = 1
     mypy_checks = mypy_file_checks + mypy_status_check
     expected_warnings = 2  # https://github.com/python/mypy/issues/14603
+    if MYPY_VERSION == Version("1.9.0"):
+        # A fresh mypy cache creates two additional files without encoding.
+        expected_warnings = 4
     result.assert_outcomes(passed=mypy_checks, warnings=expected_warnings)
 
 
@@ -536,7 +539,7 @@
         child.expect(pyfile.basename + " ____")
         child.expect("2: error: Incompatible return value")
         child.expect("==== mypy ====")
-        child.expect("Found 1 error in 1 file (checked 1 source file)")
+        child.expect(r"Found 1 error in 1 file \(checked 1 source file\)")
         child.expect("2 failed")
         child.expect("#### LOOPONFAILING ####")
         _expect_waiting()
