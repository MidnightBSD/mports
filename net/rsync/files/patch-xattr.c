--- xattrs.c.orig	2026-04-16 08:59:40.232388000 -0400
+++ xattrs.c	2026-04-16 08:59:55.963110000 -0400
@@ -861,7 +861,7 @@
 	}
 
 	if (need_sort && count > 1)
-		qsort(temp_xattr.items, count, sizeof (rsync_xa), rsync_xal_compare_names);
+		qsort(temp_xattr.items, temp_xattr.count, sizeof (rsync_xa), rsync_xal_compare_names);
 
 	ndx = rsync_xal_store(&temp_xattr); /* adds item to rsync_xal_l */
 
