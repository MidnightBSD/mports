--- setup.py.orig
+++ setup.py
@@ -92,9 +92,14 @@
     for a in assignments:
         if (len(a.targets) == 1 and
                 isinstance(a.targets[0], ast.Name) and
-                a.targets[0].id == "__version__" and
-                isinstance(a.value, ast.Str)):
-            version = a.value.s
+                a.targets[0].id == "__version__"):
+            if hasattr(ast, "Str") and isinstance(a.value, ast.Str):
+                version = a.value.s
+            elif (hasattr(ast, "Constant")
+                  and isinstance(a.value, ast.Constant)
+                  and isinstance(a.value.value, str)):
+                version = a.value.value
+assert version is not None

 setup(name='html5lib',
       version=version,
