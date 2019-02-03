--- mdnsd.h.orig	2009-06-07 15:08:03 -0400
+++ mdnsd.h	2009-06-07 15:16:34 -0400
@@ -2,6 +2,9 @@
 #define mdnsd_h
 #include "1035.h"
 #include <sys/time.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <strings.h>
 
 typedef struct mdnsd_struct *mdnsd; // main daemon data
 typedef struct mdnsdr_struct *mdnsdr; // record entry
