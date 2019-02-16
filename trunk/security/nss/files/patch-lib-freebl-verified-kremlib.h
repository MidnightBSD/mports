--- lib/freebl/verified/kremlib.h.bak	2018-10-15 23:55:45.000000000 -0400
+++ lib/freebl/verified/kremlib.h	2018-11-23 16:05:25.187442000 -0500
@@ -222,7 +222,7 @@
 #define be32toh(x) BE_32(x)
 
 /* ... for the BSDs */
-#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__DragonFly__)
+#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 #include <sys/endian.h>
 #elif defined(__OpenBSD__)
 #include <endian.h>
