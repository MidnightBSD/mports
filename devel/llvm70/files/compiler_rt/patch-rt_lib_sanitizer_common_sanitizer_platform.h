--- lib/sanitizer_common/sanitizer_platform.h.orig	2020-06-06 17:41:33.199444000 -0400
+++ lib/sanitizer_common/sanitizer_platform.h	2020-06-06 17:42:23.711455000 -0400
@@ -15,7 +15,7 @@
 
 #if !defined(__linux__) && !defined(__FreeBSD__) && !defined(__NetBSD__) && \
   !defined(__OpenBSD__) && !defined(__APPLE__) && !defined(_WIN32) && \
-  !defined(__Fuchsia__) && !defined(__rtems__) && \
+  !defined(__Fuchsia__) && !defined(__rtems__) && !defined(__MidnightBSD__) && \
   !(defined(__sun__) && defined(__svr4__))
 # error "This operating system is not supported"
 #endif
@@ -26,7 +26,7 @@
 # define SANITIZER_LINUX   0
 #endif
 
-#if defined(__FreeBSD__)
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
 # define SANITIZER_FREEBSD 1
 #else
 # define SANITIZER_FREEBSD 0
