--- maneditop.c.orig	Tue Nov 16 13:09:17 2004
+++ maneditop.c	Tue Nov 16 19:27:06 2004
@@ -238,9 +238,7 @@
 		/* Not exist, so need to create a new one */
 		rmkdir(
 		    (const char *)tmp_dir_rtn,
-		    S_IRUSR | S_IWUSR | S_IXUSR |
-		    S_IRGRP | S_IXGRP |
-		    S_IROTH | S_IXOTH
+		    S_IRUSR | S_IWUSR | S_IXUSR
 		);
 	    }
 	}
