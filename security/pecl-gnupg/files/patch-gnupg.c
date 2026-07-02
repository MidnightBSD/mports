--- gnupg.c.orig	2025-02-11 15:30:39 UTC
+++ gnupg.c
@@ -1930,4 +1930,6 @@ PHP_FUNCTION(gnupg_gettrustlist)
-	char *pattern;
-	phpc_str_size_t	pattern_len;
-	phpc_val sub_arr;
-	gpgme_trust_item_t item;
+	char *pattern;
+	phpc_str_size_t	pattern_len;
+#if GPGME_VERSION_NUMBER < 0x020000
+	phpc_val sub_arr;
+	gpgme_trust_item_t item;
+#endif
@@ -1949,18 +1951,22 @@ PHP_FUNCTION(gnupg_gettrustlist)
-	if (!PHP_GNUPG_DO(gpgme_op_trustlist_start(PHPC_THIS->ctx, pattern, 0))) {
-		GNUPG_ERR("could not start trustlist");
-		return;
-	}
-	PHPC_ARRAY_INIT(return_value);
-	while (PHP_GNUPG_DO(gpgme_op_trustlist_next(PHPC_THIS->ctx, &item))) {
-		PHPC_VAL_MAKE(sub_arr);
-		PHPC_ARRAY_INIT(PHPC_VAL_CAST_TO_PZVAL(sub_arr));
-
-		PHP_GNUPG_ARRAY_ADD_ASSOC_LONG(sub_arr, level, item);
-		PHP_GNUPG_ARRAY_ADD_ASSOC_LONG(sub_arr, type, item);
-		PHP_GNUPG_ARRAY_ADD_ASSOC_CSTR(sub_arr, keyid, item);
-		PHP_GNUPG_ARRAY_ADD_ASSOC_CSTR_EX(sub_arr, ownertrust, item, owner_trust);
-		PHP_GNUPG_ARRAY_ADD_ASSOC_CSTR(sub_arr, validity, item);
-		PHP_GNUPG_ARRAY_ADD_ASSOC_CSTR(sub_arr, name, item);
-		gpgme_trust_item_unref(item);
-		PHPC_ARRAY_ADD_NEXT_INDEX_ZVAL(return_value, PHPC_VAL_CAST_TO_PZVAL(sub_arr));
-	}
+#if GPGME_VERSION_NUMBER < 0x020000
+	if (!PHP_GNUPG_DO(gpgme_op_trustlist_start(PHPC_THIS->ctx, pattern, 0))) {
+		GNUPG_ERR("could not start trustlist");
+		return;
+	}
+	PHPC_ARRAY_INIT(return_value);
+	while (PHP_GNUPG_DO(gpgme_op_trustlist_next(PHPC_THIS->ctx, &item))) {
+		PHPC_VAL_MAKE(sub_arr);
+		PHPC_ARRAY_INIT(PHPC_VAL_CAST_TO_PZVAL(sub_arr));
+		PHP_GNUPG_ARRAY_ADD_ASSOC_LONG(sub_arr, level, item);
+		PHP_GNUPG_ARRAY_ADD_ASSOC_LONG(sub_arr, type, item);
+		PHP_GNUPG_ARRAY_ADD_ASSOC_CSTR(sub_arr, keyid, item);
+		PHP_GNUPG_ARRAY_ADD_ASSOC_CSTR_EX(sub_arr, ownertrust, item, owner_trust);
+		PHP_GNUPG_ARRAY_ADD_ASSOC_CSTR(sub_arr, validity, item);
+		PHP_GNUPG_ARRAY_ADD_ASSOC_CSTR(sub_arr, name, item);
+		gpgme_trust_item_unref(item);
+		PHPC_ARRAY_ADD_NEXT_INDEX_ZVAL(return_value, PHPC_VAL_CAST_TO_PZVAL(sub_arr));
+	}
+#else
+	php_error_docref(NULL TSRMLS_CC, E_WARNING, "trustlist is not supported by GPGME 2");
+	RETURN_FALSE;
+#endif
