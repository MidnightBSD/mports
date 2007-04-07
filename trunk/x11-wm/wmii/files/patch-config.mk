--- config.mk.orig	Thu Mar 29 18:51:44 2007
+++ config.mk	Sat Apr  7 11:39:56 2007
@@ -1,15 +1,15 @@
 # Customize below to fit your system
 
 # paths
-PREFIX = /usr/local
+#PREFIX = /usr/local
 BIN = ${PREFIX}/bin
-MAN = ${PREFIX}/share/man
+MAN = ${PREFIX}/man
 ETC = ${PREFIX}/etc
 LIBDIR = ${PREFIX}/lib
 INCLUDE = ${PREFIX}/include
 
 # Includes and libs
-INCS = -I. -I${ROOT}/include -I${INCLUDE} -I/usr/include
+INCS = -I. -I${ROOT}/include -I${INCLUDE} -I/usr/include -I${LOCALBASE}/include
 LIBS = -L/usr/lib -lc
 
 # Flags
@@ -28,8 +28,8 @@
 AWKPATH = /usr/bin/awk
 P9PATHS = /usr/local/plan9 /usr/local/9 /opt/plan9 /opt/9 /usr/plan9 /usr/9
 
-INCX11 = -I/usr/X11R6/include
-LIBX11 = -L/usr/X11R6/lib -lX11
+INCX11 = -I${X11BASE}/include
+LIBX11 = -L${X11BASE}/lib -lX11
 LIBIXP = ${ROOT}/libixp/libixp.a
 
 # Solaris
