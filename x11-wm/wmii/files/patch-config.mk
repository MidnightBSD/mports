--- config.mk.orig	Wed Dec 27 15:52:20 2006
+++ config.mk	Sun Dec 31 19:33:03 2006
@@ -4,16 +4,16 @@
 # Customize below to fit your system
 
 # paths
-PREFIX = /usr/local
+PREFIX = ${LOCALBASE}
 CONFPREFIX = ${PREFIX}/etc
 MANPREFIX = ${PREFIX}/share/man
 
-X11INC = /usr/X11R6/include
-X11LIB = /usr/X11R6/lib
+X11INC = ${X11BASE}/include
+X11LIB = ${X11BASE}/lib
 
 # includes and libs
-INCS = -I. -I${PREFIX}/include -I/usr/include -I${X11INC}
-LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 -L${PREFIX}/lib -lixp -lm
+INCS = -I. -I/usr/local/include -I/usr/include -I${X11INC}
+LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 -L/usr/local/lib -lixp -lm
 
 # flags
 CFLAGS = -Os ${INCS} -DVERSION=\"${VERSION}\"
