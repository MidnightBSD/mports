--- include/net-snmp/system/midnightbsd3.h.orig	2020-10-18 15:51:37.716139000 -0400
+++ include/net-snmp/system/midnightbsd3.h	2020-10-18 15:54:54.809599000 -0400
@@ -0,0 +1,4 @@
+/* midnightbsd2 is a superset of freebsd10 */
+#include "freebsd12.h"
+#define freebsd12 freebsd12
+#define midnightbsd3 midnightbsd3
