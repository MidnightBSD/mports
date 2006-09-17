
$FreeBSD: ports/archivers/gtar/files/patch-src::create.c,v 1.2 2004/04/28 21:00:26 naddy Exp $

--- src/create.c.orig	Thu Apr 22 17:51:04 2004
+++ src/create.c	Thu Apr 22 17:51:24 2004
@@ -1408,7 +1408,7 @@
 	  if (linklen != stat->stat.st_size || linklen + 1 == 0)
 	    xalloc_die ();
 	  buffer = (char *) alloca (linklen + 1);
-	  size = readlink (p, buffer, linklen + 1);
+	  size = readlink (p, buffer, linklen);
 	  if (size < 0)
 	    {
 	      readlink_diag (p);
