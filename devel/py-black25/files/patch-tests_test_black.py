--- tests/test_black.py.orig	2020-02-02 00:00:00 UTC
+++ tests/test_black.py	2026-11-14 06:59:50 UTC
@@ -17,0 +18 @@
+from importlib.metadata import version as imp_version
@@ -28,0 +30,2 @@
+from pathspec.patterns.gitignore.spec import GitIgnoreSpecPattern
+from packaging.version import Version
@@ -106 +109 @@
-class FakeParameter(click.Parameter):
+class FakeParameter(click.Option):
@@ -110 +113 @@
-        pass
+        super().__init__(["--fake"])
@@ -117 +120,10 @@
-        super().__init__(mix_stderr=False)
+        if Version(imp_version("click")) >= Version("8.2.0"):
+            super().__init__()
+        else:
+            super().__init__(mix_stderr=False)
+
+    def invoke(self, *args: Any, **kwargs: Any) -> Any:
+        result = super().invoke(*args, **kwargs)
+        if Version(imp_version("click")) >= Version("8.2.0"):
+            result.output_bytes = result.stdout_bytes
+        return result
@@ -2455 +2467 @@
-            "gitwildmatch", ["exclude/", ".definitely_exclude"]
+            GitIgnoreSpecPattern, ["exclude/", ".definitely_exclude"]
@@ -2630 +2642 @@
-        gitignore = PathSpec.from_lines("gitwildmatch", [])
+        gitignore = PathSpec.from_lines(GitIgnoreSpecPattern, [])
