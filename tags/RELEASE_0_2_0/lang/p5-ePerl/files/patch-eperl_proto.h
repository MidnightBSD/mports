--- eperl_proto.h.orig	Fri Jul 10 03:52:24 1998
+++ eperl_proto.h	Sun Mar 30 22:17:30 2008
@@ -79,9 +79,8 @@
 extern char *ePerl_Efwrite(char *cpBuf, int nBuf, int cNum, char *cpOut);
 extern char *ePerl_Cfwrite(char *cpBuf, int nBuf, int cNum, char *cpOut);
 extern char *strnchr(char *buf, char chr, int n);
-extern char *strnstr(char *buf, char *str, int n);
+/*extern char *strnstr(char *buf, char *str, int n);*/
 extern char *strncasestr(char *buf, char *str, int n);
-extern char *strndup(char *buf, int n);
 extern char *ePerl_Bristled2Plain(char *cpBuf);
 
 /* eperl_pp.c */
