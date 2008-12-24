--- terminal/terminal-app.c	2007-12-02 09:15:45.000000000 -0500
+++ terminal/terminal-app.c	2008-06-15 21:00:18.000000000 -0400
@@ -348,7 +348,7 @@
 {
   const gchar *other_name;
 #if GTK_CHECK_VERSION(2,10,0)
-  GdkColormap *colormap;
+//  GdkColormap *colormap;
 #endif
   GdkDisplay  *display = NULL;
   GdkScreen   *screen = NULL;
@@ -412,21 +412,21 @@
 
 #if GTK_CHECK_VERSION(2,10,0)
   /* check if we already checked this screen */
-  if (g_object_get_data (G_OBJECT (screen), "terminal-checked-screen") == NULL)
-    {
+//  if (g_object_get_data (G_OBJECT (screen), "terminal-checked-screen") == NULL)
+//    {
       /* check if we can use ARGB visual for this screen */
-      colormap = gdk_screen_get_rgba_colormap (screen);
-      if (G_LIKELY (colormap != NULL))
-        {
+//      colormap = gdk_screen_get_rgba_colormap (screen);
+//      if (G_LIKELY (colormap != NULL))
+//        {
           /* use ARGB visual for all windows on this screen, required
            * for real transparency with a compositing manager.
            */
-          gdk_screen_set_default_colormap (screen, colormap);
-        }
+//          gdk_screen_set_default_colormap (screen, colormap);
+//        }
 
       /* mark this screen as handled */
-      g_object_set_data (G_OBJECT (screen), I_("terminal-checked-screen"), GINT_TO_POINTER (1));
-    }
+//      g_object_set_data (G_OBJECT (screen), I_("terminal-checked-screen"), GINT_TO_POINTER (1));
+//    }
 #endif
 
   return screen;
