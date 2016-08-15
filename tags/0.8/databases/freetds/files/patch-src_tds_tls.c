--- src/tds/tls.c.orig	2015-06-09 10:38:40 UTC
+++ src/tds/tls.c
@@ -46,6 +46,10 @@
 #include <sys/stat.h>
 #endif /* HAVE_SYS_STAT_H */
 
+#if defined(__FreeBSD__) || defined(__DragonFly__)
+#include <sys/socket.h>
+#endif
+
 #include <freetds/tds.h>
 #include <freetds/string.h>
 #include <freetds/tls.h>
