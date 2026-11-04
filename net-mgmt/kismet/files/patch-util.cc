--- util.cc.orig	2019-05-10 19:25:15.082178000 -0400
+++ util.cc	2019-05-10 19:25:42.673317000 -0400
@@ -819,7 +819,7 @@
 	memset(statbuf, 0, sizeof(statbuf));
 
 #ifdef HAVE_SETPROCTITLE
-# if __FreeBSD__ >= 4 && !defined(FREEBSD4_0) && !defined(FREEBSD4_1)
+# if defined(__MidnightBSD__) || __FreeBSD__ >= 4 && !defined(FREEBSD4_0) && !defined(FREEBSD4_1)
 	/* FreeBSD's setproctitle() automatically prepends the process name. */
 	vsnprintf(statbuf, sizeof(statbuf), fmt, msg);
 
