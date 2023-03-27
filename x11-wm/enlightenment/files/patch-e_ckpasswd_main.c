--- src/bin/e_ckpasswd_main.c.orig	2023-03-27 13:01:12.396015000 -0400
+++ src/bin/e_ckpasswd_main.c	2023-03-27 13:03:30.042195000 -0400
@@ -2,6 +2,8 @@
 
 #include "config.h"
 
+#define __XSI_VISIBLE=1
+
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
@@ -39,7 +41,7 @@
 
 
 
-#elif defined(__FreeBSD__)
+#elif defined(__FreeBSD__) || defined(__MidnightBSD__)
 #include <security/pam_constants.h>
 
 static int
