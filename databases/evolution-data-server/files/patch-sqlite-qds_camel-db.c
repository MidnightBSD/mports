--- src/camel/camel-db.c.orig
+++ src/camel/camel-db.c
@@ -872,0 +873,4 @@
+
+	/* Enable double-quoted string compatibility used by existing databases. */
+	sqlite3_db_config (db, SQLITE_DBCONFIG_DQS_DDL, 1, NULL);
+	sqlite3_db_config (db, SQLITE_DBCONFIG_DQS_DML, 1, NULL);
