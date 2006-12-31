--- config.mk.orig	Sun Dec 31 16:53:00 2006
+++ config.mk	Sun Dec 31 16:53:59 2006
@@ -4,12 +4,12 @@
 # Customize below to fit your system
 
 # paths
-PREFIX = /usr/local
+PREFIX = ${LOCALBASE}
 MANPREFIX = ${PREFIX}/share/man
 
 # includes and libs
-INCS = -I. -I/usr/include
-LIBS = -L/usr/lib -lc -L.
+INCS = -I. -I/usr/include -I${LOCALBASE}/include
+LIBS = -L/usr/lib -lc -L. -L${LOCALBASE}/lib
 
 # flags
 CFLAGS = -Os ${INCS} -DVERSION=\"${VERSION}\"
