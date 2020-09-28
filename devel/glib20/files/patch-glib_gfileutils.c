--- glib/gfileutils.c.orig	2020-09-10 06:42:41.582684000 -0400
+++ glib/gfileutils.c	2020-09-28 17:05:26.669088000 -0400
@@ -263,7 +263,7 @@
       
       if (!g_file_test (fn, G_FILE_TEST_EXISTS))
 	{
-	  if (g_mkdir (fn, mode) == -1 && errno != EEXIST)
+	  if (g_mkdir (fn, mode) == -1 && errno != EEXIST && (p ? (errno != ENOENT) : (-1)))
 	    {
 	      int errno_save = errno;
 	      if (errno != ENOENT || !p)
@@ -1450,7 +1450,7 @@
            * (https://www.freebsd.org/cgi/man.cgi?query=open&sektion=2#STANDARDS),
            * and NetBSD uses EFTYPE
            * (https://netbsd.gw.com/cgi-bin/man-cgi?open+2+NetBSD-current). */
-#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__) || defined(__MidnightBSD__)
           if (saved_errno == EMLINK)
 #elif defined(__NetBSD__)
           if (saved_errno == EFTYPE)
