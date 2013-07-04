--- ./lib/private.h.orig	2001-10-10 05:48:11.000000000 -0400
+++ ./lib/private.h	2009-06-23 19:35:15.499808776 -0400
@@ -26,6 +26,9 @@
  *      $Id: patch-lib__private.h,v 1.1 2009-09-24 02:55:56 laffer1 Exp $
  */
 
+#undef NULL
+#define NULL 0
+
 #define TRUE 1
 #define FALSE 0
 #define MAXINCR 20
