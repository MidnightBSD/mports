$FreeBSD: /repoman/r/pcvs/ports/archivers/gtar/files/patch-src_extract.c,v 1.1 2006/11/30 20:31:51 naddy Exp $

--- src/extract.c.orig
+++ src/extract.c
@@ -1121,10 +1121,6 @@
       *fun = extract_volhdr;
       break;
 
-    case GNUTYPE_NAMES:
-      *fun = extract_mangle_wrapper;
-      break;
-
     case GNUTYPE_MULTIVOL:
       ERROR ((0, 0,
 	      _("%s: Cannot extract -- file is continued from another volume"),
