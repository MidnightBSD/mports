--- tests/test_cli.py.orig
+++ tests/test_cli.py
@@ -11,7 +11,10 @@

 import click
 import pytest
-from _pytest.monkeypatch import notset
+try:
+    from _pytest.monkeypatch import notset
+except ImportError:
+    from _pytest.monkeypatch import NOTSET as notset
 from click.testing import CliRunner

 from flask import Blueprint
