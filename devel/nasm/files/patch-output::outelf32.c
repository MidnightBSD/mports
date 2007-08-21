--- output/outelf32.c.orig	Tue Aug 21 15:41:39 2007
+++ output/outelf32.c	Tue Aug 21 15:42:09 2007
@@ -1461,7 +1461,7 @@
        the source-file, the n_desc field should be set to the number
        of remaining stabs
      */
-    WRITE_STAB(sptr, fileidx[0], 0, 0, 0, strlen(allfiles[0] + 12));
+    WRITE_STAB(sptr, fileidx[0], 0, 0, 0, stabstrlen);
 
     ptr = stabslines;
     numstabs = 0;
