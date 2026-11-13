--- tests/test_qtbot_pep8_aliases.py.orig	2025-07-01 17:24:09 UTC
+++ tests/test_qtbot_pep8_aliases.py
@@ -75,3 +75,3 @@
     "qtbot_subclass, method_name, pep8_name",
-    generate_test_cases_for_test_subclass_of_qtbot_has_overwritten_pep8_aliases(),
+    list(generate_test_cases_for_test_subclass_of_qtbot_has_overwritten_pep8_aliases()),
 )
