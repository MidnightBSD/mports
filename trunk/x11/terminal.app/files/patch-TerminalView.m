--- TerminalView.m.orig	2004-07-20 21:12:17 -0400
+++ TerminalView.m	2009-04-13 22:58:01 -0400
@@ -15,32 +15,16 @@
 #include <math.h>
 #include <unistd.h>
 
-#ifdef __NetBSD__
-#  include <sys/types.h>
-#  include <sys/ioctl.h>
-#  include <termios.h>
-#  include <pcap.h>
-#else
-#ifdef freebsd
 #  include <sys/types.h>
 #  include <sys/ioctl.h>
 #  include <termios.h>
 #  include <libutil.h>
 #  include <pcap.h>
-#else
-#  include <termio.h>
-#endif
-#endif
 
 #include <sys/time.h>
 #include <sys/types.h>
 #include <unistd.h>
 #include <fcntl.h>
-#ifndef freebsd
-#ifndef __NetBSD__
-#  include <pty.h>
-#endif
-#endif
 
 #include <Foundation/NSBundle.h>
 #include <Foundation/NSDebug.h>
