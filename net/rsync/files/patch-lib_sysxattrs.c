--- lib/sysxattrs.c.orig	2026-08-13 00:02:58 UTC
+++ lib/sysxattrs.c
@@ -185,10 +185,7 @@
-	for (off = 0; off < len; off += keylen + 1) {
-		keylen = ((unsigned char*)list)[off];
-		if (off + keylen >= len) {
-			/* Should be impossible, but bugs happen! */
-			errno = EINVAL;
-			return -1;
-		}
-		memmove(list+off, list+off+1, keylen);
-		list[off+keylen] = '\0';
-	}
+	keylen = (unsigned char)list[0];
+	memmove(list, list+1, len-1);
+	list[len-1] = '\0';
+	for (off = keylen; off < len - 1; off += keylen + 1) {
+		keylen = (unsigned char)list[off];
+		list[off] = '\0';
+	}
