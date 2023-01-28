--- libs/gst/net/gstnetutils.c.orig	2023-01-27 20:04:19 UTC
+++ libs/gst/net/gstnetutils.c
@@ -37,9 +37,8 @@
 #include <gst/gstinfo.h>
 #include <errno.h>
 
-#ifdef HAVE_SYS_SOCKET_H
+#include <sys/types.h>
 #include <sys/socket.h>
-#endif
 
 #ifndef G_OS_WIN32
 #include <netinet/in.h>
