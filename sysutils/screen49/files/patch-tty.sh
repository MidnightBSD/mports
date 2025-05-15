--- tty.sh.orig	2020-09-15 14:25:07.717607000 -0400
+++ tty.sh	2020-09-15 14:25:35.245231000 -0400
@@ -784,7 +784,7 @@
   /*
    * Under BSD we have to set the controlling terminal again explicitly.
    */
-# if (defined(__FreeBSD_kernel__) || defined(__DragonFly__) || defined(__GNU__) || defined(__OpenBSD__)) && defined(TIOCSCTTY)
+# if (defined(__MidnightBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__) || defined(__GNU__) || defined(__OpenBSD__)) && defined(TIOCSCTTY)
   ioctl(fd, TIOCSCTTY, (char *)0);
 # endif
 
