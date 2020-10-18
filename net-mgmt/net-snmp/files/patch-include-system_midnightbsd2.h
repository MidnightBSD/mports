--- include/net-snmp/system/midnightbsd2.h.orig	2020-10-18 15:51:37.716139000 -0400
+++ include/net-snmp/system/midnightbsd2.h	2020-10-18 15:54:54.809599000 -0400
@@ -0,0 +1,4 @@
+/* midnightbsd2 is a superset of freebsd10 */
+#include "midnightbsd1.h"
+#define freebsd10 freebsd10
+#define midnightbsd2 midnightbsd2
