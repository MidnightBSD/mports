--- TerminalView.m.orig	2004-07-20 21:12:17 -0400
+++ TerminalView.m	2009-04-13 22:52:57 -0400
@@ -28,6 +28,13 @@
 #  include <libutil.h>
 #  include <pcap.h>
 #else
+#ifdef __MidnightBSD__
+#  include <sys/types.h>
+#  include <sys/ioctl.h>
+#  include <termios.h>
+#  include <libutil.h>
+#  include <pcap.h>
+#else
 #  include <termio.h>
 #endif
 #endif
@@ -38,9 +45,11 @@
 #include <fcntl.h>
 #ifndef freebsd
 #ifndef __NetBSD__
+#ifndef __MidnightBSD__
 #  include <pty.h>
 #endif
 #endif
+#endif
 
 #include <Foundation/NSBundle.h>
 #include <Foundation/NSDebug.h>
