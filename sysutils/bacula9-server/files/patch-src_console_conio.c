--- src/console/conio.c.orig
+++ src/console/conio.c
@@ -56,6 +56,7 @@
 
 #include <curses.h>
 #include <term.h>
+#include <termios.h>
 
 #ifdef HAVE_SUN_OS
 #ifndef _TERM_H
