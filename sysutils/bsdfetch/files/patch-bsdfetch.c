--- bsdfetch.c.orig	2023-01-08 13:19:42 UTC
+++ bsdfetch.c
@@ -184,7 +184,7 @@ static void get_packages(void) {
 #if defined (__OpenBSD__) || defined (__NetBSD__)
 	const char* const cmd = "/usr/sbin/pkg_info";
 
-#elif defined (__DragonFly__) || defined (__FreeBSD__)
+#elif defined (__DragonFly__) || defined (__FreeBSD__) && !defined(__MidnightBSD__)
 	const char* const cmd = "/usr/sbin/pkg info";
 
 #elif defined (__MidnightBSD__)
