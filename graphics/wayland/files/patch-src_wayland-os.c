--- src/wayland-os.c.orig	2022-06-18 17:47:25 UTC
+++ src/wayland-os.c
@@ -42,6 +42,8 @@
 
 #include "wayland-os.h"
 
+#define SOL_LOCAL 0
+
 static int
 set_cloexec_or_close(int fd)
 {
@@ -79,7 +81,7 @@ wl_os_socket_cloexec(int domain, int typ
 	return set_cloexec_or_close(fd);
 }
 
-#if defined(__FreeBSD__)
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
 int
 wl_os_socket_peercred(int sockfd, uid_t *uid, gid_t *gid, pid_t *pid)
 {
