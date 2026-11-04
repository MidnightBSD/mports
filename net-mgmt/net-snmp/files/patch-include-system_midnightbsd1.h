--- include/net-snmp/system/midnightbsd1.h.orig	2020-10-18 15:51:37.714810000 -0400
+++ include/net-snmp/system/midnightbsd1.h	2020-10-18 15:51:37.714975000 -0400
@@ -0,0 +1,4 @@
+/* midnightbsd is a superset of freebsd9 */
+#include "freebsd9.h"
+#define freebsd9 freebsd9
+#define midnightbsd1 midnightbsd1
