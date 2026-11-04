--- TerminalView.m.orig	2017-08-02 13:17:43.000000000 -0400
+++ TerminalView.m	2018-10-08 20:18:21.177517000 -0400
@@ -34,7 +34,7 @@
 #  include <pcap.h>
 #  include <util.h>
 #define TCSETS TIOCSETA
-#elif defined(__FreeBSD__)
+#elif defined(__FreeBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 #  include <sys/types.h>
 #  include <sys/ioctl.h>
 #  include <termios.h>
@@ -53,7 +53,7 @@
 #include <sys/types.h>
 #include <unistd.h>
 #include <fcntl.h>
-#ifndef __FreeBSD__
+#if !defined(__FreeBSD__) && !defined(__DragonFly__) && !defined(__MidnightBSD__)
 #if !(defined (__NetBSD__)) && !(defined (__SOLARIS__)) && !(defined(__OpenBSD__))
 #  include <pty.h>
 #endif
