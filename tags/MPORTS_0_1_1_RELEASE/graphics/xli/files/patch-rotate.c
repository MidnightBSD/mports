--- ./rotate.c.orig	Sun Oct 24 22:15:04 1999
+++ ./rotate.c	Sun Apr 29 00:53:19 2007
@@ -43,7 +43,7 @@
 	int dlinelen;		/* Length of destination line  */
 	int bit[8];		/* Array of hex values         */
 	int x, y;
-	int i, b;
+	int i, b, tlen;
 	int newi, newb;
 	byte **yptr;
 
@@ -168,8 +168,9 @@
 			freeImage(simage);
 		simage = dimage;
 	}
-	dimage->title = (char *) lmalloc(strlen(iimage->title) + 40);
-	sprintf(dimage->title, "%s (rotated by %d degrees)", iimage->title, rot);
+	tlen = strlen(iimage->title) + 40;
+	dimage->title = (char *) lmalloc(tlen);
+	snprintf(dimage->title, tlen, "%s (rotated by %d degrees)", iimage->title, rot);
 	dimage->gamma = iimage->gamma;
 	if (verbose)
 		printf("done\n");
