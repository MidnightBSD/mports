--- pytest_relaxed/plugin.py.orig	2024-03-29 15:48:55 UTC
+++ pytest_relaxed/plugin.py
@@ -40 +40 @@
-@pytest.mark.trylast  # So we can be sure builtin terminalreporter exists
+@pytest.hookimpl(trylast=True)  # Wait for the builtin terminalreporter.
