--- ./libmailutils/base/hostname.c.orig	2023-06-03 11:10:47.545823000 -0400
+++ ./libmailutils/base/hostname.c	2023-06-03 11:11:37.133254000 -0400
@@ -25,6 +25,7 @@
 #include <string.h>
 #include <netdb.h>
 #include <mailutils/alloc.h>
+#include <sys/socket.h>
 
 #ifndef MAXHOSTNAMELEN
 # define MAXHOSTNAMELEN 64
