--- src/network/kernel/qnetworkinterface_unix.cpp.orig	2019-10-05 19:29:00.300944000 -0400
+++ src/network/kernel/qnetworkinterface_unix.cpp	2019-10-05 19:30:10.307419000 -0400
@@ -59,6 +59,14 @@
 # include <ifaddrs.h>
 #endif
 
+#include <sys/param.h>
+#include <sys/time.h>
+#include <sys/socket.h>
+#include <net/if.h>
+#include <net/if_var.h>
+#include <net/if_types.h>
+
+
 #ifdef QT_LINUXBASE
 #  include <arpa/inet.h>
 #  ifndef SIOCGIFBRDADDR
