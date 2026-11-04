--- src/attack.c	2024-04-24 02:59:35.930683000 -0500
+++ src/attack.c	2024-04-24 03:02:33.794371000 -0500
@@ -31,7 +31,6 @@
 #include "utils.h"
 
 #include <arpa/inet.h> /* for inet_ntoa() */
-#include <bsd/unistd.h>
 #include <errno.h> /* for errno() */
 #include <fcntl.h>
 #include <glib.h>
