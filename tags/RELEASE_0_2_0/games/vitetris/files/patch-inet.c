--- src/socket/inet.c.orig	Sun Apr 27 19:38:35 2008
+++ src/socket/inet.c	Sun Apr 27 19:44:03 2008
@@ -3,7 +3,7 @@
 #include <sys/socket.h>
 #include <netinet/in.h>
 #include <netdb.h>
-
+#include <resolv.h>
 #include <string.h>	/* strerror */
 #include <errno.h>
 
