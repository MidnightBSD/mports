--- src/basic/socket-util.c.orig	2021-10-26 14:02:39 UTC
+++ src/basic/socket-util.c
@@ -5,7 +5,7 @@
 #include "socket-util.h"
 #include "strv.h"
 
-#ifdef __FreeBSD__
+#if defined(__MidnightBSD__) || defined(__FreeBSD__)
 #include <sys/ucred.h>
 #include <sys/un.h>
 #endif
@@ -33,7 +33,7 @@ int fd_inc_rcvbuf(int fd, size_t n) {
 }
 
 int getpeercred(int fd, struct ucred *ucred) {
-#ifdef __FreeBSD__
+#if defined(__MidnightBSD__) || defined(__FreeBSD__)
         struct xucred cred;
         socklen_t len = sizeof cred;
         if (getsockopt(fd, 0, LOCAL_PEERCRED, &cred, &len) == -1) {
@@ -75,7 +75,7 @@ int getpeercred(int fd, struct ucred *uc
 }
 
 int getpeersec(int fd, char **ret) {
-#ifdef __FreeBSD__
+#if defined(__MidnightBSD__) || defined(__FreeBSD__)
         return -EOPNOTSUPP;
 #else
         _cleanup_free_ char *s = NULL;
