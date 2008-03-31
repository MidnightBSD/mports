--- eperl_parse.c.orig	Fri Jul 10 03:50:48 1998
+++ eperl_parse.c	Sun Mar 30 22:18:15 2008
@@ -298,6 +298,7 @@
     return NULL;
 }
 
+#ifdef NOTDEF
 char *strnstr(char *buf, char *str, int n)
 {
     char *cp;
@@ -311,6 +312,7 @@
     }
     return NULL;
 }
+#endif
 
 char *strncasestr(char *buf, char *str, int n)
 {
@@ -325,16 +327,6 @@
     }
     return NULL;
 }
-
-char *strndup(char *buf, int n)
-{
-    char *cp;
-
-    cp = (char *)malloc(n+1);
-    strncpy(cp, buf, n);
-    return cp;
-}
-
 
 /*
 **  convert buffer from bristled format to plain format
