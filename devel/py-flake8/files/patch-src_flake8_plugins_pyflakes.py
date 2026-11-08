--- src/flake8/plugins/pyflakes.py.orig
+++ src/flake8/plugins/pyflakes.py
@@ -50,6 +50,8 @@
     "YieldOutsideFunction": "F704",
     "ReturnOutsideFunction": "F706",
     "DefaultExceptNotLast": "F707",
+    "LazyImportNotAtModuleScope": "F708",
+    "LazyImportStarNotPermitted": "F709",
     "DoctestSyntaxError": "F721",
     "ForwardAnnotationSyntaxError": "F722",
     "RedefinedWhileUnused": "F811",
@@ -60,20 +62,39 @@
     "DuplicateArgument": "F831",
     "UnusedVariable": "F841",
     "UnusedAnnotation": "F842",
+    "EagerUseOfLazyImport": "F851",
     "RaiseNotImplemented": "F901",
 }
 
 
-class FlakesChecker(pyflakes.checker.Checker):
+class FlakesChecker:
     """Subclass the Pyflakes checker to conform with the flake8 API."""
 
-    with_doctest = False
+    _with_doctest = False
+    _builtins = None
 
     def __init__(self, tree: ast.AST, filename: str) -> None:
         """Initialize the PyFlakes plugin with an AST tree and filename."""
-        super().__init__(
-            tree, filename=filename, withDoctest=self.with_doctest
+        self._checker = pyflakes.checker.Checker(
+            tree,
+            filename=filename,
+            builtins=self._builtins,
+            withDoctest=self._with_doctest,
         )
+
+    def run(self) -> Generator[tuple[int, int, str, type[Any]]]:
+        """Run the plugin."""
+        for message in self._checker.messages:
+            col = getattr(message, "col", 0)
+            yield (
+                message.lineno,
+                col,
+                "{} {}".format(
+                    FLAKE8_PYFLAKES_CODES.get(type(message).__name__, "F999"),
+                    message.message % message.message_args,
+                ),
+                message.__class__,
+            )
 
     @classmethod
     def add_options(cls, parser: OptionManager) -> None:
@@ -95,20 +116,5 @@
     @classmethod
     def parse_options(cls, options: argparse.Namespace) -> None:
         """Parse option values from Flake8's OptionManager."""
-        if options.builtins:
-            cls.builtIns = cls.builtIns.union(options.builtins)
-        cls.with_doctest = options.doctests
-
-    def run(self) -> Generator[tuple[int, int, str, type[Any]]]:
-        """Run the plugin."""
-        for message in self.messages:
-            col = getattr(message, "col", 0)
-            yield (
-                message.lineno,
-                col,
-                "{} {}".format(
-                    FLAKE8_PYFLAKES_CODES.get(type(message).__name__, "F999"),
-                    message.message % message.message_args,
-                ),
-                message.__class__,
-            )
+        cls._builtins = options.builtins
+        cls._with_doctest = options.doctests
