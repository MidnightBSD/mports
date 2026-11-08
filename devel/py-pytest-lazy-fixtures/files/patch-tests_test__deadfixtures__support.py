--- tests/test_deadfixtures_support.py.orig
+++ tests/test_deadfixtures_support.py
@@ -1,1 +1,1 @@
-from pytest_deadfixtures import EXIT_CODE_SUCCESS  # type: ignore[import-untyped]
+from pytest_deadfixtures.plugin import EXIT_CODE_SUCCESS  # type: ignore[import-untyped]
