Use SQL string literals on SQLite builds without double-quoted strings.

--- sqlite_utils/db.py.orig
+++ sqlite_utils/db.py
@@ -3932,7 +3932,7 @@
         if fts_table is not None:
             with self.db.atomic():
                 self.db.execute("""
-                    INSERT INTO {table} ({table}) VALUES ("optimize");
+                    INSERT INTO {table} ({table}) VALUES ('optimize');
                 """.strip().format(table=quote_identifier(fts_table)))
         return self
 
