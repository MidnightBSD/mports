--- bsdfetch.c.orig	2022-12-30 08:05:37 UTC
+++ bsdfetch.c
@@ -248,7 +248,7 @@ static void get_packages(void) {
 	f = popen("/usr/sbin/pkg_info", "r");
 #elif defined( __DragonFly__)
 	f = popen("/usr/sbin/pkg info", "r");
-#elif defined(__FreeBSD__)
+#elif defined(__FreeBSD__) && !defined(__MidnightBSD__)
 	if(access("/usr/local/sbin/pkg", F_OK) == 0) {
 		f = popen("/usr/local/sbin/pkg info", "r");
 	} else {
