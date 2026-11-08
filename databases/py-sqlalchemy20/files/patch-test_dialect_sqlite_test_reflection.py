--- test/dialect/sqlite/test_reflection.py.orig	2026-09-15 20:58:50 UTC
+++ test/dialect/sqlite/test_reflection.py
@@ -1,5 +1,8 @@
 """SQLite-specific tests."""
 
+from contextlib import contextmanager
+import sqlite3
+
 from sqlalchemy import CheckConstraint
 from sqlalchemy import Column
 from sqlalchemy import DDL
@@ -26,6 +29,37 @@ from sqlalchemy.types import String
 from sqlalchemy.types import String
 
 
+@contextmanager
+def _allow_double_quoted_ddl(conn):
+    """Temporarily enable SQLite double-quoted literals for this fixture."""
+    option = getattr(sqlite3, "SQLITE_DBCONFIG_DQS_DDL", None)
+    dbapi = conn.connection.dbapi_connection
+    driver = conn.connection.driver_connection
+    raw = getattr(driver, "_conn", driver)
+    if option is None or not hasattr(raw, "setconfig"):
+        yield
+        return
+    if hasattr(dbapi, "run_async"):
+        # aiosqlite owns sqlite3.Connection in its worker thread.
+        previous = dbapi.run_async(
+            lambda c: c._execute(c._conn.getconfig, option)
+        )
+        dbapi.run_async(lambda c: c._execute(c._conn.setconfig, option, True))
+        try:
+            yield
+        finally:
+            dbapi.run_async(
+                lambda c: c._execute(c._conn.setconfig, option, previous)
+            )
+    else:
+        previous = raw.getconfig(option)
+        raw.setconfig(option, True)
+        try:
+            yield
+        finally:
+            raw.setconfig(option, previous)
+
+
 def exec_sql(engine, sql, *args, **kwargs):
     # TODO: convert all tests to not use this
     with engine.begin() as conn:
@@ -322,23 +356,24 @@ class ConstraintReflectionTest(fixtures.TestBase):
 
             # Test CHECK constraints with parentheses in string literals
             # These cases have unbalanced parens if we naively count all parens
-            conn.exec_driver_sql(
-                "CREATE TABLE parens_in_strings ("
-                " field TEXT,"
-                " CHECK (field != '('),"
-                " CHECK (field != ')'),"
-                " CHECK (field NOT LIKE '%('),"
-                " CHECK (field IN (')', '(', 'test')),"
-                # Escaped quotes (SQLite uses '' to escape quotes)
-                " CHECK (field != 'it''s (not) valid'),"
-                ' CHECK (field != "say ""(hello)"" "),'
-                " CHECK (field NOT IN ('()', 'a''b''c', ')')),"
-                # Complex nested cases with lots of unbalanced parens in
-                # strings
-                " CHECK (field != '((' OR field = ')))'),"
-                ' CHECK (field LIKE "%))(%" OR field LIKE "%)(%")'
-                ")"
-            )
+            with _allow_double_quoted_ddl(conn):
+                conn.exec_driver_sql(
+                    "CREATE TABLE parens_in_strings ("
+                    " field TEXT,"
+                    " CHECK (field != '('),"
+                    " CHECK (field != ')'),"
+                    " CHECK (field NOT LIKE '%('),"
+                    " CHECK (field IN (')', '(', 'test')),"
+                    # Escaped quotes (SQLite uses '' to escape quotes)
+                    " CHECK (field != 'it''s (not) valid'),"
+                    ' CHECK (field != "say ""(hello)"" "),'
+                    " CHECK (field NOT IN ('()', 'a''b''c', ')')),"
+                    # Complex nested cases with lots of unbalanced parens in
+                    # strings
+                    " CHECK (field != '((' OR field = ')))'),"
+                    ' CHECK (field LIKE "%))(%" OR field LIKE "%)(%")'
+                    ")"
+                )
 
     @classmethod
     def teardown_test_class(cls):
@@ -1561,20 +1596,20 @@ class ComputedReflectionTest(fixtures.TestBase):
         (
             """CREATE TABLE test3 (
                 s VARCHAR,
-                x INTEGER GENERATED ALWAYS AS (INSTR(s, ","))
+                x INTEGER GENERATED ALWAYS AS (INSTR(s, ','))
             );""",
             "test3",
-            {"x": {"text": 'INSTR(s, ",")', "stored": False}},
+            {"x": {"text": "INSTR(s, ',')", "stored": False}},
         ),
         (
             """CREATE TABLE test4 (
                 s VARCHAR,
-                x INTEGER GENERATED ALWAYS AS (INSTR(s, ",")),
-                y INTEGER GENERATED ALWAYS AS (INSTR(x, ",")));""",
+                x INTEGER GENERATED ALWAYS AS (INSTR(s, ',')),
+                y INTEGER GENERATED ALWAYS AS (INSTR(x, ',')));""",
             "test4",
             {
-                "x": {"text": 'INSTR(s, ",")', "stored": False},
-                "y": {"text": 'INSTR(x, ",")', "stored": False},
+                "x": {"text": "INSTR(s, ',')", "stored": False},
+                "y": {"text": "INSTR(x, ',')", "stored": False},
             },
         ),
         (
@@ -1600,21 +1635,21 @@ class ComputedReflectionTest(fixtures.TestBase):
         (
             """CREATE TABLE test7 (
                 s VARCHAR,
-                x INTEGER GENERATED ALWAYS AS (INSTR(s, ",")) STORED
+                x INTEGER GENERATED ALWAYS AS (INSTR(s, ',')) STORED
             );""",
             "test7",
-            {"x": {"text": 'INSTR(s, ",")', "stored": True}},
+            {"x": {"text": "INSTR(s, ',')", "stored": True}},
         ),
         (
             """CREATE TABLE test8 (
                 s VARCHAR,
-                x INTEGER GENERATED ALWAYS AS (INSTR(s, ",")) STORED,
-                y INTEGER GENERATED ALWAYS AS (INSTR(x, ",")) STORED
+                x INTEGER GENERATED ALWAYS AS (INSTR(s, ',')) STORED,
+                y INTEGER GENERATED ALWAYS AS (INSTR(x, ',')) STORED
             );""",
             "test8",
             {
-                "x": {"text": 'INSTR(s, ",")', "stored": True},
-                "y": {"text": 'INSTR(x, ",")', "stored": True},
+                "x": {"text": "INSTR(s, ',')", "stored": True},
+                "y": {"text": "INSTR(x, ',')", "stored": True},
             },
         ),
         (
