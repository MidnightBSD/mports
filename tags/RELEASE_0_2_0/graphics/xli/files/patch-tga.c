--- ./tga.c.orig	Sun Oct 24 22:15:05 1999
+++ ./tga.c	Sun Apr 29 00:53:19 2007
@@ -116,7 +116,7 @@
 	char colors[40];
 
 	if (hp->ImgType == TGA_Map || hp->ImgType == TGA_RLEMap)
-		sprintf(colors," with %d colors",hp->Length);
+		snprintf(colors,sizeof(colors)," with %d colors",hp->Length);
 	else
 		colors[0] = '\000';
 
