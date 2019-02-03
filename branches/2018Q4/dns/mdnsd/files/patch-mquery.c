--- mquery.c.orig	2009-06-07 15:09:37 -0400
+++ mquery.c	2009-06-07 15:09:51 -0400
@@ -3,6 +3,7 @@
 #include <netinet/in.h>
 #include <fcntl.h>
 #include <errno.h>
+#include <strings.h>
 
 #include "mdnsd.h"
 
