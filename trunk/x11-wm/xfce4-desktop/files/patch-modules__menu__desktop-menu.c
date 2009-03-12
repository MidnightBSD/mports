--- ./modules/menu/desktop-menu.c.orig	Wed Feb 25 17:32:50 2009
+++ ./modules/menu/desktop-menu.c	Thu Mar 12 19:10:22 2009
@@ -105,6 +105,9 @@
 G_MODULE_EXPORT void xfce_desktop_menu_destroy_impl(XfceDesktopMenu *desktop_menu);
 G_MODULE_EXPORT gchar *g_module_check_init(GModule *module);
 
+/* init stuff (mbsd added) */
+G_MODULE_EXPORT void xfce_desktop_menu_init(const gchar*);
+G_MODULE_EXPORT void xfce_desktop_menu_shutdown();
 
 static void _xfce_desktop_menu_free_menudata(XfceDesktopMenu *desktop_menu);
 
@@ -117,6 +120,16 @@
                                    XfceMenu *xfce_menu,
                                    GtkWidget *menu,
                                    GList **menu_items_return);
+
+G_MODULE_EXPORT void xfce_desktop_menu_init(const gchar *name) 
+{
+  xfce_menu_init(name);
+}
+
+G_MODULE_EXPORT void xfce_desktop_menu_shutdown()
+{
+  xfce_menu_shutdown();
+}
 
 static void
 itheme_changed_cb(GtkIconTheme *itheme, gpointer user_data)
