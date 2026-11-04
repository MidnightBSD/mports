--- tests/websocket-test.c.orig
+++ tests/websocket-test.c
@@ -25,5 +25,9 @@
 #include <zlib.h>
 #ifdef G_OS_UNIX
 #include <sys/mman.h>
 #include <sys/socket.h>
 #endif
+
+#ifndef MAP_NORESERVE
+#define MAP_NORESERVE 0
+#endif
