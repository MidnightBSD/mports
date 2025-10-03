--- libgps/shared_json.c.orig	2023-01-10 22:38:26 UTC
+++ libgps/shared_json.c
@@ -19,6 +19,7 @@ PERMISSIONS
 
 #include <math.h>
 #include <stdbool.h>
+#include <string.h>
 
 #include "../include/gpsd.h"
 #ifdef SOCKET_EXPORT_ENABLE
