--- main.c.orig	Tue Jun 17 19:13:44 2008
+++ main.c	Thu Oct 16 15:15:51 2008
@@ -64,6 +64,10 @@
 #include <pcap.h>
 
 /* Old versions of PCAP defined it as D_IN */
+#ifndef D_IN
+#define D_IN PCAP_D_IN
+#endif
+/* Old versions of PCAP defined it as D_IN */
 #ifndef PCAP_D_IN
 #define PCAP_D_IN D_IN
 #endif
