--- ./reduce.c.orig	Sun Oct 24 22:15:02 1999
+++ ./reduce.c	Sun Apr 29 00:53:19 2007
@@ -178,7 +178,7 @@
 	/* get destination image */
 	depth = colorsToDepth(OutColors);
 	new_image = newRGBImage(image->width, image->height, depth);
-	sprintf(buf, "%s (%d colors)", image->title, OutColors);
+	snprintf(buf, sizeof(buf), "%s (%d colors)", image->title, OutColors);
 	new_image->title = dupString(buf);
 	new_image->gamma = image->gamma;
 
