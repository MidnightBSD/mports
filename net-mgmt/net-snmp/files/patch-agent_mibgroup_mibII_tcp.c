--- agent/mibgroup/mibII/tcp.c.orig	2026-05-07 11:47:05.333066000 -0400
+++ agent/mibgroup/mibII/tcp.c	2026-05-07 11:47:14.001310000 -0400
@@ -7,6 +7,18 @@
 #include <net-snmp/net-snmp-config.h>
 #include <net-snmp/net-snmp-features.h>
 #include "mibII_common.h"
+
+#include <sys/param.h>
+
+#if (defined(__FreeBSD_version) && __FreeBSD_version > 1400066) || \
+    defined(__MidnightBSD_version)
+#ifndef hz
+#define hz		1000	/* kernel ticks per second */
+#endif
+#define IPFRAGTTL	60	/* time to live for frags, slowhz */
+#define PR_SLOWHZ	2	/* 2 slow timeouts per second */
+#define PR_FASTHZ	5	/* 5 fast timeouts per second */
+#endif
 
 #if HAVE_STDLIB_H
 #include <stdlib.h>
