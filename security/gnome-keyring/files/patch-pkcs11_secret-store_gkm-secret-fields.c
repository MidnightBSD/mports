--- pkcs11/secret-store/gkm-secret-fields.c.orig	2025-09-13 11:58:24 UTC
+++ pkcs11/secret-store/gkm-secret-fields.c
@@ -162,3 +162,4 @@ gkm_secret_fields_parse (CK_ATTRIBUTE_PTR attr,
-	last = ptr + attr->ulValueLen;
-	if (!ptr && last != ptr)
-		return CKR_ATTRIBUTE_VALUE_INVALID;
+	if (!ptr && attr->ulValueLen != 0)
+		return CKR_ATTRIBUTE_VALUE_INVALID;
+
+	last = ptr + attr->ulValueLen;
