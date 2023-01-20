--- libgps/shared_json.c.orig	2023-01-20 14:32:14.523266000 -0500
+++ libgps/shared_json.c	2023-01-20 14:32:30.385997000 -0500
@@ -19,6 +19,7 @@
 
 #include <math.h>
 #include <stdbool.h>
+#include <string.h>
 
 #include "../include/gpsd.h"
 #ifdef SOCKET_EXPORT_ENABLE
