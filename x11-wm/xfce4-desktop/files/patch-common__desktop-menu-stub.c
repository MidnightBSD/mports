--- ./common/desktop-menu-stub.c.orig	Mon Jan 12 17:03:12 2009
+++ ./common/desktop-menu-stub.c	Thu Mar 12 19:03:52 2009
@@ -118,9 +118,9 @@
     }
     
     if(!_setup_functions(module)
-       || !g_module_symbol(module, "xfce_menu_init",
+       || !g_module_symbol(module, "xfce_desktop_menu_init",
                            (gpointer)&my_xfce_menu_init)
-       || !g_module_symbol(module, "xfce_menu_shutdown",
+       || !g_module_symbol(module, "xfce_desktop_menu_shutdown",
                            (gpointer)&my_xfce_menu_shutdown))
     {
         if(err) {
