--- tests/conftest.py.orig
+++ tests/conftest.py
@@ -3,6 +3,11 @@

 import pytest
 from _pytest import monkeypatch
+
+try:
+    from _pytest.monkeypatch import notset
+except ImportError:
+    from _pytest.monkeypatch import NOTSET as notset

 from flask import Flask
 from flask.globals import request_ctx
@@ -16,15 +21,15 @@
     """
     mp = monkeypatch.MonkeyPatch()
     out = (
-        (os.environ, "FLASK_ENV_FILE", monkeypatch.notset),
-        (os.environ, "FLASK_APP", monkeypatch.notset),
-        (os.environ, "FLASK_DEBUG", monkeypatch.notset),
-        (os.environ, "FLASK_RUN_FROM_CLI", monkeypatch.notset),
-        (os.environ, "WERKZEUG_RUN_MAIN", monkeypatch.notset),
+        (os.environ, "FLASK_ENV_FILE", notset),
+        (os.environ, "FLASK_APP", notset),
+        (os.environ, "FLASK_DEBUG", notset),
+        (os.environ, "FLASK_RUN_FROM_CLI", notset),
+        (os.environ, "WERKZEUG_RUN_MAIN", notset),
     )

     for _, key, value in out:
-        if value is monkeypatch.notset:
+        if value is notset:
             mp.delenv(key, False)
         else:
             mp.setenv(key, value)
