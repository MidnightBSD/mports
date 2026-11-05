--- Drivers/MiniSQL/SQLConnect.c.orig	2022-02-09 21:44:40 UTC
+++ Drivers/MiniSQL/SQLConnect.c
@@ -31,7 +31,7 @@
     if( SQL_NULL_HDBC == hDbc )
 		return SQL_INVALID_HANDLE;
 
-	sprintf( hDbc->szSqlMsg, "hDbc=$%08lX szDataSource=(%s)", hDbc, szDataSource );
+	snprintf( hDbc->szSqlMsg, sizeof(hDbc->szSqlMsg), "hDbc=$%08lX szDataSource=(%s)", hDbc, szDataSource );
 	logPushMsg( hDbc->hLog, __FILE__, __FILE__, __LINE__, LOG_WARNING, LOG_WARNING, hDbc->szSqlMsg );
 
     if( hDbc->bConnected == 1 )
@@ -58,7 +58,7 @@
 	SQLGetPrivateProfileString( szDataSource, "DATABASE", "", szDATABASE, sizeof(szDATABASE), ".odbc.ini" );
 	if ( szDATABASE[0] == '\0' )
 	{
-		sprintf( hDbc->szSqlMsg, "SQL_ERROR Could not find Driver entry for %s in system information", szDataSource );
+		snprintf( hDbc->szSqlMsg, sizeof(hDbc->szSqlMsg), "SQL_ERROR Could not find Driver entry for %s in system information", szDataSource );
 		logPushMsg( hDbc->hLog, __FILE__, __FILE__, __LINE__, LOG_WARNING, LOG_WARNING, hDbc->szSqlMsg );
 		return SQL_ERROR;
 	}
@@ -76,9 +76,9 @@
 	{
 		if ( msqlLoadConfigFile( szCONFIGFILE ) != 0 )
 		{
-			sprintf( hDbc->szSqlMsg, "SQL_ERROR %s", msqlErrMsg );
+			snprintf( hDbc->szSqlMsg, sizeof(hDbc->szSqlMsg), "SQL_ERROR %s", msqlErrMsg );
 			logPushMsg( hDbc->hLog, __FILE__, __FILE__, __LINE__, LOG_WARNING, LOG_WARNING, hDbc->szSqlMsg );
-			sprintf( hDbc->szSqlMsg, "SQL_WARNING Failed to use (%s)", szCONFIGFILE );
+			snprintf( hDbc->szSqlMsg, sizeof(hDbc->szSqlMsg), "SQL_WARNING Failed to use (%s)", szCONFIGFILE );
 			logPushMsg( hDbc->hLog, __FILE__, __FILE__, __LINE__, LOG_WARNING, LOG_WARNING, hDbc->szSqlMsg );
 			return SQL_ERROR;
 		}
@@ -94,9 +94,9 @@
 
 	if ( hDbc->hDbcExtras->hServer < 0 )
 	{
-		sprintf( hDbc->szSqlMsg, "SQL_ERROR %s", msqlErrMsg );
+		snprintf( hDbc->szSqlMsg, sizeof(hDbc->szSqlMsg), "SQL_ERROR %s", msqlErrMsg );
 		logPushMsg( hDbc->hLog, __FILE__, __FILE__, __LINE__, LOG_WARNING, LOG_WARNING, hDbc->szSqlMsg );
-		sprintf( hDbc->szSqlMsg, "SQL_ERROR Failed to connect to (%s)", szHOST );
+		snprintf( hDbc->szSqlMsg, sizeof(hDbc->szSqlMsg), "SQL_ERROR Failed to connect to (%s)", szHOST );
 		logPushMsg( hDbc->hLog, __FILE__, __FILE__, __LINE__, LOG_WARNING, LOG_WARNING, hDbc->szSqlMsg );
 		return SQL_ERROR;
 	}
@@ -108,14 +108,14 @@
 	{
 		if ( msqlSelectDB( hDbc->hDbcExtras->hServer, szDATABASE ) == -1 )
 		{
-			sprintf( hDbc->szSqlMsg, "SQL_WARNING %s", msqlErrMsg );
+			snprintf( hDbc->szSqlMsg, sizeof(hDbc->szSqlMsg), "SQL_WARNING %s", msqlErrMsg );
 			logPushMsg( hDbc->hLog, __FILE__, __FILE__, __LINE__, LOG_WARNING, LOG_WARNING, hDbc->szSqlMsg );
-			sprintf( hDbc->szSqlMsg, "SQL_WARNING Connected to server but failed to use database (%s)", szDATABASE );
+			snprintf( hDbc->szSqlMsg, sizeof(hDbc->szSqlMsg), "SQL_WARNING Connected to server but failed to use database (%s)", szDATABASE );
 			logPushMsg( hDbc->hLog, __FILE__, __FILE__, __LINE__, LOG_WARNING, LOG_WARNING, hDbc->szSqlMsg );
 		}
 		else
 		{
-			sprintf( hDbc->szSqlMsg, "SQL_INFO DATABASE=%s", szDATABASE );
+			snprintf( hDbc->szSqlMsg, sizeof(hDbc->szSqlMsg), "SQL_INFO DATABASE=%s", szDATABASE );
 			logPushMsg( hDbc->hLog, __FILE__, __FILE__, __LINE__, LOG_WARNING, LOG_WARNING, hDbc->szSqlMsg );
 		}
 
