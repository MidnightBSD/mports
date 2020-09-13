--- http.c.orig	2020-07-28 17:40:38.643843000 -0400
+++ http.c	2020-07-28 17:40:17.288684000 -0400
@@ -2010,7 +2010,7 @@
 			return HTTP_START_FAILED;
 		}
 		rewind(result);
-		if (ftruncate(fileno(result), 0) < 0) {
+		if (ftruncate(fileno((FILE *)result), 0) < 0) {
 			error_errno("unable to truncate a file");
 			return HTTP_START_FAILED;
 		}
