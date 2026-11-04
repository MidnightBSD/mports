--- src/bitmask.cpp.orig	2004-10-08 16:39:46 UTC
+++ src/bitmask.cpp
@@ -312,7 +312,7 @@
 static INLINE int bitcount(unsigned long n)
 {
-  register unsigned long tmp;
+  unsigned long tmp;
   return (tmp = (n) - (((n) >> 1) & 033333333333) - (((n) >> 2) & 011111111111),\
           tmp = ((tmp + (tmp >> 3)) & 030707070707),			\
           tmp =  (tmp + (tmp >> 6)),					\
