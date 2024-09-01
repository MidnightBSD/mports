--- http.c.orig	2024-07-29 10:24:50.000000000 -0400
+++ http.c	2024-09-01 14:46:57.095735000 -0400
@@ -2273,7 +2273,7 @@
 				return HTTP_START_FAILED;
 			}
 			rewind(result);
-			if (ftruncate(fileno(result), 0) < 0) {
+			if (ftruncate(fileno((FILE *)result), 0) < 0) {
 				error_errno("unable to truncate a file");
 				return HTTP_START_FAILED;
 			}
