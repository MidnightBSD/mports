
$FreeBSD: ports/archivers/gtar/files/patch-src_tar.c,v 1.1 2005/01/30 14:55:41 naddy Exp $

--- src/tar.c.orig
+++ src/tar.c
@@ -617,9 +617,9 @@
   
   switch (key)
     {
-      case 1:
+      case ARGP_KEY_ARG:
 	/* File name or non-parsed option, because of ARGP_IN_ORDER */
-	name_add (optarg);
+	name_add (arg);
 	args->input_files++;
 	break;
 
