--- plugins/screenshot.c.orig	2010-05-21 11:18:14 UTC
+++ plugins/screenshot.c
@@ -182,8 +182,6 @@
 static int
-shotSort (const void *_a,
-	  const void *_b)
+shotSort (const struct dirent **a,
+	  const struct dirent **b)
 {
-    struct dirent **a = (struct dirent **) _a;
-    struct dirent **b = (struct dirent **) _b;
-    int		  al = strlen ((*a)->d_name);
-    int		  bl = strlen ((*b)->d_name);
+    int al = strlen ((*a)->d_name);
+    int bl = strlen ((*b)->d_name);
