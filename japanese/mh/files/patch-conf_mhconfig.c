--- conf/mhconfig.c.orig	1999-01-06 15:46:12 UTC
+++ conf/mhconfig.c
@@ -266,7 +266,8 @@ static char *makefiles[] = {
 
 
 static do_sed(), do_sedfile(), do_files(), do_doc(), do_make();
-static shell(), arginit(), add_option(), trim();
+static shell(), arginit(), add_option();
+static void trim();
 
 static char   *stradd (), *strdup (), *tail ();
 
@@ -959,7 +960,8 @@ end_myopt () {
 
 /*  */
 
-static  trim (s)
+static void
+trim (s)
 char   *s;
 {
     char   *p;
