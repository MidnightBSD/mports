--- asttokens/asttokens.py.orig
+++ asttokens/asttokens.py
@@ -412,7 +412,8 @@
     - ``ast.arguments`` / ``astroid.Arguments``
     - ``ast.withitem``
     - ``astroid.Comprehension``
-    - ``astroid.AssignName`` inside ``astroid.Arguments`` or ``astroid.ExceptHandler``
+    - ``astroid.AssignName`` inside ``astroid.Arguments``, ``astroid.ExceptHandler``,
+      or ``astroid.MatchAs`` with a nested pattern
     - The following nodes in Python 3.8 only:
       - ``ast.arg``
       - ``ast.Starred``
@@ -427,7 +428,13 @@
         # astroid nodes
         not isinstance(node, ast.AST) and node is not None and (
             type(node).__name__ == "AssignName"
-            and type(node.parent).__name__ in ("Arguments", "ExceptHandler")
+            and (
+                type(node.parent).__name__ in ("Arguments", "ExceptHandler")
+                or (
+                    type(node.parent).__name__ == "MatchAs"
+                    and node.parent.pattern is not None
+                )
+            )
         )
       )
       and 'pypy' not in sys.version.lower()
