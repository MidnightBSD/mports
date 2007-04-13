
$FreeBSD: ports/devel/nasm/files/patch-output::outelf.c,v 1.2 2005/01/24 23:14:54 krion Exp $

--- output/outelf.c.orig
+++ output/outelf.c
@@ -1431,7 +1431,7 @@
        the source-file, the n_desc field should be set to the number
        of remaining stabs
      */
-    WRITE_STAB(sptr, fileidx[0], 0, 0, 0, strlen(allfiles[0] + 12));
+    WRITE_STAB(sptr, fileidx[0], 0, 0, 0, stabstrlen);
 
     ptr = stabslines;
     numstabs = 0;
