--- libgphoto2_port/serial/unix.c.orig	2018-09-13 13:56:02.389432000 -0400
+++ libgphoto2_port/serial/unix.c	2018-09-13 13:56:48.691535000 -0400
@@ -121,6 +121,14 @@
 #define GP_PORT_SERIAL_RANGE_HIGH       (0xf)
 #endif
 
+/* MidnightBSD */
+#ifdef __MidnightBSD__
+#define GP_PORT_SERIAL_PREFIX   "/dev/cuad%x"
+#define GP_PORT_SERIAL_RANGE_LOW        0
+#define GP_PORT_SERIAL_RANGE_HIGH       (0xf)
+#endif
+
+
 /* OpenBSD */
 /* devices appear to go up to /dev/cuac7, but we just list the first 4 */
 #ifdef __OpenBSD__
@@ -419,7 +427,7 @@
 	}
 	dev->pl->fd = -1;
 
-#if defined(__FreeBSD__) || defined(__APPLE__) || defined(__DragonFly__)
+#if defined(__FreeBSD__) || defined(__APPLE__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 	dev->pl->fd = open (port, O_RDWR | O_NOCTTY | O_NONBLOCK);
 #elif OS2
 	fd = open (port, O_RDWR | O_BINARY);
