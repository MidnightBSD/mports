--- Drivers/template/SQLConnect.c.orig	2022-02-09 21:44:40 UTC
+++ Drivers/template/SQLConnect.c
@@ -32,7 +32,7 @@
     if( SQL_NULL_HDBC == hDbc )
 		return SQL_INVALID_HANDLE;
 
-	sprintf((char*) hDbc->szSqlMsg, "hDbc=$%08lX 3zDataSource=(%s)", (long)hDbc, szDataSource );
+	snprintf((char*) hDbc->szSqlMsg, sizeof(hDbc->szSqlMsg), "hDbc=$%08lX 3zDataSource=(%s)", (long)hDbc, szDataSource );
 	logPushMsg( hDbc->hLog, __FILE__, __FILE__, __LINE__, LOG_WARNING, LOG_WARNING,(char*) hDbc->szSqlMsg );
 
     if( hDbc->bConnected == 1 )
@@ -70,7 +70,7 @@
 	SQLGetPrivateProfileString((char*) szDataSource, "DATABASE", "", szDATABASE, sizeof(szDATABASE), "odbc.ini" );
 	if ( szDATABASE[0] == '\0' )
 	{
-		sprintf((char*) hDbc->szSqlMsg, "SQL_ERROR Could not find Driver entry for %s in system information", szDataSource );
+		snprintf((char*) hDbc->szSqlMsg, sizeof(hDbc->szSqlMsg), "SQL_ERROR Could not find Driver entry for %s in system information", szDataSource );
 		logPushMsg( hDbc->hLog, __FILE__, __FILE__, __LINE__, LOG_WARNING, LOG_WARNING,(char*) hDbc->szSqlMsg );
 		return SQL_ERROR;
 	}
