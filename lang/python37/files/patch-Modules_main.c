--- Modules/main.c.orig	2020-06-27 17:34:23.791622000 -0400
+++ Modules/main.c	2020-06-27 17:35:05.255035000 -0400
@@ -22,7 +22,7 @@
 #  include <windows.h>  /* STATUS_CONTROL_C_EXIT */
 #endif
 
-#ifdef __FreeBSD__
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
 #  include <fenv.h>
 #endif
 
@@ -3007,7 +3007,7 @@
      * Python requires non-stop mode.  Alas, some platforms enable FP
      * exceptions by default.  Here we disable them.
      */
-#ifdef __FreeBSD__
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
     fedisableexcept(FE_OVERFLOW);
 #endif
 
