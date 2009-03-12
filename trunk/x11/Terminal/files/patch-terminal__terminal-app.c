--- ./terminal/terminal-app.c.orig	Thu Mar  5 20:33:55 2009
+++ ./terminal/terminal-app.c	Thu Mar  5 20:34:07 2009
@@ -362,7 +362,7 @@
 terminal_app_find_screen (const gchar *display_name)
 {
   const gchar *other_name;
-  GdkColormap *colormap;
+//  GdkColormap *colormap;
   GdkDisplay  *display = NULL;
   GdkScreen   *screen = NULL;
   GSList      *displays;
@@ -424,21 +424,21 @@
     }
 
   /* check if we already checked this screen */
-  if (g_object_get_data (G_OBJECT (screen), "terminal-checked-screen") == NULL)
-    {
+  //if (g_object_get_data (G_OBJECT (screen), "terminal-checked-screen") == NULL)
+  //  {
       /* check if we can use ARGB visual for this screen */
-      colormap = gdk_screen_get_rgba_colormap (screen);
-      if (G_LIKELY (colormap != NULL))
-        {
+   //   colormap = gdk_screen_get_rgba_colormap (screen);
+   //   if (G_LIKELY (colormap != NULL))
+   //     {
           /* use ARGB visual for all windows on this screen, required
            * for real transparency with a compositing manager.
            */
-          gdk_screen_set_default_colormap (screen, colormap);
-        }
+   //       gdk_screen_set_default_colormap (screen, colormap);
+   //     }
 
       /* mark this screen as handled */
-      g_object_set_data (G_OBJECT (screen), I_("terminal-checked-screen"), GINT_TO_POINTER (1));
-    }
+  //    g_object_set_data (G_OBJECT (screen), I_("terminal-checked-screen"), GINT_TO_POINTER (1));
+  //  }
 
   return screen;
 }
