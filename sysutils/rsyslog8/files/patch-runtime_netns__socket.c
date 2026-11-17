--- runtime/netns_socket.c.orig
+++ runtime/netns_socket.c
@@ -25,6 +25,7 @@
 #include <fcntl.h>
 #include <sched.h>
 #include <string.h>
+#include <unistd.h>
 #include <sys/socket.h>
 #include <sys/types.h>
