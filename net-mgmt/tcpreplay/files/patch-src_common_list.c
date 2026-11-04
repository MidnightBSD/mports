--- src/common/list.c.orig	2025-08-27 06:21:35 UTC
+++ src/common/list.c
@@ -73,7 +73,7 @@ parse_list(tcpr_list_t **listdata, char *ourstr)
     int rcode;
     regex_t preg;
-    char regex[] = "^[0-9]+(-([0-9]+|\\s*))?$";
+    char regex[] = "^[0-9]+(-([0-9]+|[[:space:]]*))?$";
     char *token = NULL;
     u_int i;
