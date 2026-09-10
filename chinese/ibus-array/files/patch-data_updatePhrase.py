--- data/updatePhrase.py.orig
+++ data/updatePhrase.py
@@ -21 +21 @@
-		cur.execute('INSERT INTO ' + table + ' (keys, ph) VALUES ("' + i + '", "' + j + '");')
+		cur.execute(f'INSERT INTO {table} (keys, ph) VALUES (?, ?);', (i, j))
