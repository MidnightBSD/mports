--- tests/test_license_expression.py
+++ tests/test_license_expression.py
@@ -2415,6 +2415,17 @@
         assert result.errors == []
         assert result.invalid_symbols == []
 
+    def test_validate_trailing_boolean_operator(self):
+        for operator in ("AND", "OR"):
+            expression = f"MIT {operator}"
+            result = self.licensing.validate(expression)
+            assert result.original_expression == expression
+            assert not result.normalized_expression
+            assert result.errors == [
+                f"{operator} requires two or more licenses as in: MIT {operator} BSD"
+            ]
+            assert result.invalid_symbols == []
+
     def test_validation_invalid_license_key(self):
         result = self.licensing.validate("cool-license")
         assert result.original_expression == "cool-license"
