--- src/gimp2/print.c.orig	2023-03-05 16:39:18.726997000 +0100
+++ src/gimp2/print.c	2023-03-05 16:39:46.126948000 +0100
@@ -114,8 +114,8 @@

 {
   if (gimp_thumbnail_data)
     g_free(gimp_thumbnail_data);
-  gint x = gimp_image_width(image_ID);
-  gint y = gimp_image_height(image_ID);
+  gint x = gimp_image_width(p2gint(image_ID));
+  gint y = gimp_image_height(p2gint(image_ID));
   if (*width > x)
     *width = x;
   if (*height > y)
