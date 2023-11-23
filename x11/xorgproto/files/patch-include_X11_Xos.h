--- include/X11/Xos.h.orig	2023-06-16 07:32:38 UTC
+++ include/X11/Xos.h
@@ -60,7 +60,7 @@ in this Software without prior written authorization f
  */
 
 # include <string.h>
-# if defined(__SCO__) || defined(__UNIXWARE__) || defined(__sun) || defined(__CYGWIN__) || defined(_AIX) || defined(__APPLE__) || defined(__FreeBSD__)
+# if defined(__SCO__) || defined(__UNIXWARE__) || defined(__sun) || defined(__CYGWIN__) || defined(_AIX) || defined(__APPLE__) || defined(__FreeBSD__) || defined(__MidnightBSD__)
 #  include <strings.h>
 # else
 #  ifndef index
