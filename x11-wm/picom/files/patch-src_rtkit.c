--- src/rtkit.c.orig	2026-02-07 06:29:30 UTC
+++ src/rtkit.c
@@ -15,7 +15,7 @@
 #include <sys/syscall.h>
 #elif defined(__NetBSD__)
 #include <lwp.h>
-#elif defined(__FreeBSD__)
+#elif defined(__FreeBSD__) || defined(__MidnightBSD__)
 #include <sys/thr.h>
 #elif defined(__DragonFly__)
 #include <sys/lwp.h>
@@ -35,7 +35,7 @@
 	ret = (pid_t)syscall(SYS_gettid);
 #elif defined(__NetBSD__)
 	ret = _lwp_self();
-#elif defined(__FreeBSD__)
+#elif defined(__FreeBSD__) || defined(__MidnightBSD__)
 	long lwpid;
 	thr_self(&lwpid);
 	ret = lwpid;
