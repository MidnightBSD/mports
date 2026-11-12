--- src/license_expression/__init__.py
+++ src/license_expression/__init__.py
@@ -787,7 +787,8 @@
             parsed_expression = self.parse(expression, strict=strict)
         except ExpressionError as e:
             expression_info.errors.append(str(e))
-            expression_info.invalid_symbols.append(e.token_string)
+            if hasattr(e, "token_string"):
+                expression_info.invalid_symbols.append(e.token_string)
             return expression_info
 
         # Check `expression` keys (validate)
