--- include/gpsd.h.orig	2025-08-24 15:09:13 UTC
+++ include/gpsd.h
@@ -31,6 +31,7 @@ extern "C" {
 #include <sys/select.h>    // for fd_set
 #endif  // !HAVE_WINSOCK2_H
 #include <time.h>    // for time_t
+#include <string.h>
 
 #include "gps.h"
 #include "os_compat.h"
