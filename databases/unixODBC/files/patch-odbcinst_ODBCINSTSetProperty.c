--- odbcinst/ODBCINSTSetProperty.c.orig	2018-01-02 10:48:19 UTC
+++ odbcinst/ODBCINSTSetProperty.c
@@ -45,7 +45,7 @@
 		}
 	}
 
-	sprintf( szError, "Could not find property (%s)", pszProperty );
+	snprintf( szError, sizeof(szError), "Could not find property (%s)", pszProperty );
 	inst_logPushMsg( __FILE__, __FILE__, __LINE__, LOG_WARNING, ODBC_ERROR_GENERAL_ERR, szError );
 
 	return ODBCINST_ERROR;
@@ -55,7 +55,14 @@
 {
     HODBCINSTPROPERTY hNew;
 
+    if ( !hFirstProperty || !pszProperty || !pszValue ||
+         strlen( pszProperty ) >= sizeof( hNew->szName ) ||
+         strlen( pszValue ) >= sizeof( hNew->szValue ))
+        return ODBCINST_ERROR;
+
 	hNew						= (HODBCINSTPROPERTY)malloc( sizeof(ODBCINSTPROPERTY) );
+    if ( !hNew )
+        return ODBCINST_ERROR;
 	memset(hNew, 0, sizeof(ODBCINSTPROPERTY));
 	hNew->nPromptType			= ODBCINST_PROMPTTYPE_HIDDEN;
 	hNew->pNext				= NULL;
