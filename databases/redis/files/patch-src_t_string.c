--- src/t_string.c.orig
+++ src/t_string.c
@@ -255,8 +255,9 @@
 
     if (unit == UNIT_SECONDS) *milliseconds *= 1000;
 
-    if (relative_ttl) {
-        *milliseconds += commandTimeSnapshot();
+    if (relative_ttl && add_overflow_ll(*milliseconds, commandTimeSnapshot(), milliseconds)) {
+        addReplyErrorExpireTime(c);
+        return C_ERR;
     }
 
     if (*milliseconds <= 0) {
