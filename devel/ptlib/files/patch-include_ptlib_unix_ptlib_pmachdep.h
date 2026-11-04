--- include/ptlib/unix/ptlib/pmachdep.h.orig	2019-10-10 21:28:57.314738000 -0400
+++ include/ptlib/unix/ptlib/pmachdep.h	2019-10-10 21:29:21.129750000 -0400
@@ -101,11 +101,6 @@
 #include <net/if.h>
 #include <netinet/tcp.h>
 
-/* socklen_t is defined in FreeBSD 3.4-STABLE, 4.0-RELEASE and above */
-#if (P_FREEBSD <= 340000)
-typedef int socklen_t;
-#endif
-
 #define HAS_IFREQ
 
 ///////////////////////////////////////////////////////////////////////////////
