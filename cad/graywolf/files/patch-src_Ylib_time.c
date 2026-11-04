--- src/Ylib/time.c.orig	2018-08-23 20:02:57 UTC
+++ src/Ylib/time.c
@@ -52,11 +52,7 @@ REVISIONS:  Apr 27, 1989 - changed to Y prefix and add
 #include <time.h>
 #include <yalecad/base.h>
 
-#ifdef THINK_C
 #define TIME_T time_t
-#else
-#define TIME_T long
-#endif
 
 char *YcurTime( time_in_sec )
 INT *time_in_sec ;
