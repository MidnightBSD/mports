--- data/updateShortcode.py.orig
+++ data/updateShortcode.py
@@ -21 +21 @@
-		cur.execute('INSERT INTO ' + table + ' (keys, ch) VALUES ("' + i + '", "' + j + '");')
+		cur.execute(f'INSERT INTO {table} (keys, ch) VALUES (?, ?);', (i, j))
