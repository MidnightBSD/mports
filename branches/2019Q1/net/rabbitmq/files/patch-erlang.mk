--- erlang.mk.orig	2016-06-16 21:38:27.685317266 -0400
+++ erlang.mk	2016-06-16 21:39:15.609317967 -0400
@@ -61,6 +61,8 @@
 PLATFORM = gnu
 else ifeq ($(UNAME_S),FreeBSD)
 PLATFORM = freebsd
+else ifeq ($(UNAME_S),MidnightBSD)
+PLATFORM = midnightbsd
 else ifeq ($(UNAME_S),NetBSD)
 PLATFORM = netbsd
 else ifeq ($(UNAME_S),OpenBSD)
