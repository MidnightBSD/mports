--- tests/test_sqlitedb.py.orig
+++ tests/test_sqlitedb.py
@@ -18,3 +18,3 @@
 create table name (first text, last text);
-insert into name (first, last) values ("pablo", "picasso");
+insert into name (first, last) values ('pablo', 'picasso');
 """
