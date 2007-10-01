--- parser/src/strfn.c.orig	Wed Aug 22 04:31:48 2007
+++ parser/src/strfn.c	Wed Aug 22 04:31:59 2007
@@ -44,19 +44,6 @@
     return z;
 }
 
-/* string function */
-char *strndup(const char *src, int size) {
-    int s;
-    char *r;
-
-    if ((s = strlen(src)) > size) s = size;
-    
-    r = calloc(1, s + 1);
-    memcpy(r, src, s);
-    
-    return r;
-}
-
 char *strappend(char *dst, const char *src) {
     int dlen;
     
