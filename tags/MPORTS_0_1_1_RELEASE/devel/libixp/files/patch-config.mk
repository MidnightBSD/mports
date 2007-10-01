--- config.mk.orig	Wed Dec 27 11:59:09 2006
+++ config.mk	Wed Apr  4 20:41:53 2007
@@ -4,12 +4,12 @@
 # Customize below to fit your system
 
 # paths
-PREFIX = /usr/local
-MANPREFIX = ${PREFIX}/share/man
+PREFIX = ${LOCALBASE}
+MANPREFIX = ${PREFIX}/man
 
 # includes and libs
-INCS = -I. -I/usr/include
-LIBS = -L/usr/lib -lc -L.
+INCS = -I. -I/usr/include -I${LOCALBASE}/include
+LIBS = -L/usr/lib -lc -L. -L${LOCALBASE}/lib
 
 # flags
 CFLAGS = -Os ${INCS} -DVERSION=\"${VERSION}\"
