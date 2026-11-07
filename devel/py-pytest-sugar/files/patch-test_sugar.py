--- test_sugar.py.orig
+++ test_sugar.py
@@ -114,7 +114,7 @@ class TestTerminalReporter:
     def test_report_header(self, testdir):
         testdir.makeconftest(
             """
-            def pytest_report_header(startdir):
+            def pytest_report_header():
                 pass
             """
         )
