--- parser/include/strfn.h.orig	Wed Aug 22 04:32:11 2007
+++ parser/include/strfn.h	Wed Aug 22 04:32:24 2007
@@ -37,20 +37,6 @@
 /*****************************************************************************/
 
 /*
-* strndup - Duplicate string with maximum length specified.
-*
-* WARNING: This function can process memory allocation.
-* 
-* Parameters:
-*	char *src - source string
-*	int size - new string maximum size
-*
-* Return value:
-* 	char * - new string
-*/
-char *strndup(const char *src, int size);
-
-/*
 * strappend - Append source string to destination.
 *
 * WARNING: This function can process memory allocation.
