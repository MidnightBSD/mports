Use SQL string-literal quoting in the FTS test fixture; SQLite builds with
DQS disabled treat double-quoted values as column identifiers.

--- tests/test_sqlite_fts4.py.orig
+++ tests/test_sqlite_fts4.py
@@ -23,11 +23,11 @@
     conn.executescript(
         """
 CREATE VIRTUAL TABLE search USING fts4(c0, c1);
-INSERT INTO search (c0, c1) VALUES ("this is about a dog", "more about that dog dog");
-INSERT INTO search (c0, c1) VALUES ("this is about a cat", "stuff on that cat cat");
-INSERT INTO search (c0, c1) VALUES ("something about a ferret", "yeah a ferret ferret");
-INSERT INTO search (c0, c1) VALUES ("both of them", "both dog dog and cat here");
-INSERT INTO search (c0, c1) VALUES ("not mammals", "maybe talk about fish");
+INSERT INTO search (c0, c1) VALUES ('this is about a dog', 'more about that dog dog');
+INSERT INTO search (c0, c1) VALUES ('this is about a cat', 'stuff on that cat cat');
+INSERT INTO search (c0, c1) VALUES ('something about a ferret', 'yeah a ferret ferret');
+INSERT INTO search (c0, c1) VALUES ('both of them', 'both dog dog and cat here');
+INSERT INTO search (c0, c1) VALUES ('not mammals', 'maybe talk about fish');
     """
     )
     return conn
