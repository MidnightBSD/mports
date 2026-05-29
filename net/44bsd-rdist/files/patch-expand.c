--- expand.c.orig	2013-09-17 23:46:26.681322944 -0700
+++ expand.c	2026-05-29 00:00:00.000000000 -0400
@@ -182 +182 @@ expstr(s)
-		tp = lookup(cp, NULL, 0);
+		tp = lookup(cp, LOOKUP, NULL);
@@ -309,7 +309,7 @@
 			return;
 		goto patherr2;
 	}
-	if (fstat(dirp->dd_fd, &stb) < 0)
+	if (fstat(dirfd(dirp), &stb) < 0)
 		goto patherr1;
 	if (!ISDIR(stb.st_mode)) {
 		errno = ENOTDIR;
