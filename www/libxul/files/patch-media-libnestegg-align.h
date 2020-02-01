--- media/libnestegg/src/align.h.orig	2016-05-12 13:09:57.000000000 -0400
+++ media/libnestegg/src/align.h	2020-01-26 12:58:42.832617000 -0500
@@ -12,6 +12,8 @@
  *	http://www.opensource.org/licenses/bsd-license.php
  */
 
+#include <stddef.h>
+
 #ifndef _LIBP_ALIGN_H_
 #define _LIBP_ALIGN_H_
 
@@ -39,7 +41,9 @@
 	void (*q)(void);
 };
 
+#if !defined(max_align_t)
 typedef union max_align max_align_t;
+#endif
 
 #endif
 
