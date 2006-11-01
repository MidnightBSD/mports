--- encoding.c.orig	Wed Nov  1 11:34:21 2006
+++ encoding.c	Wed Nov  1 11:35:46 2006
@@ -995,8 +995,16 @@
     {
       /* full, recycle old entry */
       if (c1 >= 0xd800 && c1 < 0xe000)
-        comb_tofront(root, c1);
+        comb_tofront(root, c1 -0xd800);
       i = combchars[root]->prev;
+      if (c1 == i + 0xd800) 
+	{
+	  /* completely full, can't recycle */
+	  debug("utf8_handle_comp: completely full!\n");
+	  mc->image = '?';
+	  mc->font  = 0;
+	  return;
+	}
       /* FIXME: delete old char from all buffers */
     }
   else if (!combchars[i])
