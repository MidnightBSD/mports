--- asttokens/mark_tokens.py.orig
+++ asttokens/mark_tokens.py
@@ -255,6 +255,20 @@
     self, node: util.Token, first_token: util.Token, last_token: util.Token
   ) -> Tuple[util.Token, util.Token]:
     last_token = self.handle_following_brackets(node, last_token, '(')
+    return (first_token, last_token)
+
+  def visit_matchas(
+    self, node: AstNode, first_token: util.Token, last_token: util.Token
+  ) -> Tuple[util.Token, util.Token]:
+    # Native AST stores capture names as strings, so they are not visited as children.
+    if node.pattern is not None and node.name is not None: # type: ignore[union-attr]
+      as_token = self._code.find_token(node.pattern.last_token, token.NAME, 'as') # type: ignore[union-attr]
+      last_token = self._code.next_token(as_token)
+
+    # Astroid uses an AssignName child, but its positions cover the entire pattern.
+    name = node.name # type: ignore[union-attr]
+    if name is not None and not isinstance(name, str):
+      name.first_token = name.last_token = last_token
     return (first_token, last_token)

   def visit_subscript(
