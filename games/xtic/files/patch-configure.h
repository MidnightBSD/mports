--- ./configure.h.org	Sun Jun 18 13:31:44 1995
+++ ./configure.h	Thu Jun 22 21:17:57 1995
@@ -20,4 +20,4 @@
 /*  Linker flags needed to locate and link in the Xpm library
  *  Change this to the correct place, if needed */
 
-#define XPMLIBRARY -L/usr/local/lib -lXpm
+#define XPMLIBRARY -L%%LOCALBASE%%/lib -lXpm
