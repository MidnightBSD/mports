
$FreeBSD: ports/devel/glib20/files/patch-gmodule::gmodule-dl.c,v 1.7 2006/10/14 08:35:12 marcus Exp $
  $MCom: ports/devel/glib20/files/patch-gmodule::gmodule-dl.c,v 1.19 2006/10/10 20:22:06 mezz Exp $

--- gmodule/gmodule-dl.c.orig	Sat Feb 17 08:28:07 2001
+++ gmodule/gmodule-dl.c	Fri Jan 18 09:48:45 2002
@@ -104,6 +104,7 @@
 static gpointer
 _g_module_self (void)
 {
+#ifndef __FreeBSD__
   gpointer handle;
   
   /* to query symbols from the program itself, special link options
@@ -115,6 +116,9 @@
     g_module_set_error (fetch_dlerror (TRUE));
   
   return handle;
+#else
+  return RTLD_DEFAULT;
+#endif
 }
 
 static void
