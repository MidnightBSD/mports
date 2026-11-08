--- libltdl/ltdl.c.orig	2023-08-08 10:39:23 UTC
+++ libltdl/ltdl.c
@@ -720,7 +720,7 @@
 
 	if (base_name && *base_name)
 	  {
-	    if (filename[lendir -1] != '/')
+	    if (lendir == 0 || filename[lendir -1] != '/')
 	      filename[lendir++] = '/';
 	    strcpy (filename +lendir, base_name);
 	  }
