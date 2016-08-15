--- common/common.h.orig	2009-08-15 22:38:43 -0400
+++ common/common.h	2009-08-15 23:08:45 -0400
@@ -57,11 +57,7 @@
 #include <arpa/nameser_compat.h>
 #else
 #ifndef _WIN32
-#if defined(_OPENBSD) || defined(_DFBSD) || defined(_FREEBSD) || defined(_NETBSD)
 #include <sys/endian.h>
-#else
-#include <endian.h>
-#endif
 #endif
 #endif
 
@@ -127,9 +123,7 @@
 	#include <netinet/ip_icmp.h>
 	#include <sys/ioctl.h>
 
-#if defined(_OPENBSD) || defined(_DARWIN) || defined(_FREEBSD) || defined(_DFBSD)
 	#include <sys/uio.h>
-#endif
 
 	#include <pthread.h>
 
