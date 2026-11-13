Use SQL string literals on SQLite builds without double-quoted strings.

--- tests/conftest.py.orig
+++ tests/conftest.py
@@ -70,9 +70,9 @@
     database = Database(memory=True)
     database.executescript("""
         CREATE TABLE foo (text TEXT);
-        INSERT INTO foo (text) values ("one");
-        INSERT INTO foo (text) values ("two");
-        INSERT INTO foo (text) values ("three");
+        INSERT INTO foo (text) values ('one');
+        INSERT INTO foo (text) values ('two');
+        INSERT INTO foo (text) values ('three');
     """)
     return database
 
