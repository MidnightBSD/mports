--- config.mk.orig	Sat Apr  7 11:45:07 2007
+++ config.mk	Sat Apr  7 11:46:13 2007
@@ -4,11 +4,11 @@
 # Customize below to fit your system
 
 # paths
-PREFIX = /usr/local
-MANPREFIX = ${PREFIX}/share/man
+#PREFIX = /usr/local
+MANPREFIX = ${PREFIX}/man
 
-X11INC = /usr/X11R6/include
-X11LIB = /usr/X11R6/lib
+X11INC = ${X11BASE}/include
+X11LIB = ${X11BASE}/lib
 
 # includes and libs
 INCS = -I. -I/usr/include -I${X11INC}
