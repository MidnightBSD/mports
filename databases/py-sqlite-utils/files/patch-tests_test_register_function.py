Use SQL string literals on SQLite builds without double-quoted strings.

--- tests/test_register_function.py.orig
+++ tests/test_register_function.py
@@ -10,7 +10,7 @@
     def reverse_string(s):
         return "".join(reversed(list(s)))
 
-    result = fresh_db.execute('select reverse_string("hello")').fetchone()[0]
+    result = fresh_db.execute("select reverse_string('hello')").fetchone()[0]
     assert result == "olleh"
 
 
@@ -19,7 +19,7 @@
     def reverse_string(s):
         return "".join(reversed(list(s)))
 
-    result = fresh_db.execute('select revstr("hello")').fetchone()[0]
+    result = fresh_db.execute("select revstr('hello')").fetchone()[0]
     assert result == "olleh"
 
 
