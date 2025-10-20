--- src/modules/raop/raop-client.c.orig	2024-01-12 17:22:09 UTC
+++ src/modules/raop/raop-client.c
@@ -39,6 +39,10 @@
 #include <sys/filio.h>
 #endif
 
+#ifdef HAVE_NETINET_IN_H
+#include <netinet/in.h>
+#endif
+
 #include <pulse/xmalloc.h>
 #include <pulse/timeval.h>
 #include <pulse/sample.h>
