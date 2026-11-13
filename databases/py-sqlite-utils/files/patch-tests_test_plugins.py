Use SQL string literals on SQLite builds without double-quoted strings.

--- tests/test_plugins.py.orig
+++ tests/test_plugins.py
@@ -119,7 +119,7 @@
 
         db = Database(memory=True)
         assert "hello" in _functions(db)
-        result = db.execute('select hello("world")').fetchone()[0]
+        result = db.execute("select hello('world')").fetchone()[0]
         assert result == "Hello, world!"
 
         # Test execute_plugins=False
