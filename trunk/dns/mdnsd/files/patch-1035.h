--- 1035.h.orig	2009-06-07 15:09:04 -0400
+++ 1035.h	2009-06-07 15:09:18 -0400
@@ -1,6 +1,9 @@
 #ifndef _1035_h
 #define _1035_h
 
+#include <stdio.h>
+#include <stdlib.h>
+
 // be familiar with rfc1035 if you want to know what all the variable names mean, but this hides most of the dirty work
 // all of this code depends on the buffer space a packet is in being 4096 and zero'd before the packet is copied in
 // also conveniently decodes srv rr's, type 33, see rfc2782
