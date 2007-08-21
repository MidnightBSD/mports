--- output/outelf64.c.orig	Tue Aug 21 15:42:22 2007
+++ output/outelf64.c	Tue Aug 21 15:42:41 2007
@@ -1460,7 +1460,7 @@
        the source-file, the n_desc field should be set to the number
        of remaining stabs
      */
-    WRITE_STAB(sptr, fileidx[0], 0, 0, 0, strlen(allfiles[0] + 12));
+    WRITE_STAB(sptr, fileidx[0], 0, 0, 0, stabstrlen);
 
     ptr = stabslines;
     numstabs = 0;
