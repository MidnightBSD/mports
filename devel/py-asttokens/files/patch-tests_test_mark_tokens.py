--- tests/test_mark_tokens.py.orig
+++ tests/test_mark_tokens.py
@@ -822,6 +822,26 @@
 """)

   if sys.version_info >= (3, 10):
+    def test_nested_match_as(self):
+      for pattern in (
+        'ast.Expr(value=ast.Constant(value=str() as doc))',
+        '[str() as first, (int() as second)]',
+        '((str() as name) | (int() as name)) as item',
+        'str() as str',
+        'str() as café',
+        '(str(\n  ) as capture)',
+        'capture',
+        '_',
+      ):
+        with self.subTest(pattern=pattern):
+          m = self.create_mark_checker('match value:\n case ' + pattern + ':\n  pass\n')
+          if self.is_astroid_test:
+            for node in m.all_nodes:
+              if (type(node).__name__ == 'AssignName' and
+                  type(node.parent).__name__ == 'MatchAs'):
+                self.assertEqual(m.atok.get_text(node), node.name)
+                self.assertEqual(m.atext.get_text(node), node.name)
+
     def test_match_case(self):
       m = self.create_mark_checker("""
 if 0:
