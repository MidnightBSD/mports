--- src/gimp2/print.c.orig	2019-03-10 16:27:46 UTC
+++ src/gimp2/print.c
@@ -114,8 +114,8 @@ stpui_get_thumbnail_data_function(void *
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
