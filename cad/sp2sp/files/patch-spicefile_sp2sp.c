--- spicefile/sp2sp.c.orig	2016-11-04 16:42:04 UTC
+++ spicefile/sp2sp.c
@@ -28,0 +29 @@
+#include <unistd.h>
@@ -235 +236 @@ main(int argc, char **argv)
-		of = (FILE *)fopen64(outfilename, "w"); /* DJW: why is the cast needed? */
+		of = fopen(outfilename, "w");
@@ -294 +295 @@ main(int argc, char **argv)
-	close(of);
+	fclose(of);
