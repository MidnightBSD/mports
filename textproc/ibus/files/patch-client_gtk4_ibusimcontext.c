--- client/gtk4/ibusimcontext.c.orig	2026-04-30 04:14:50 UTC
+++ client/gtk4/ibusimcontext.c
@@ -1626,18 +1626,34 @@ ibus_im_context_set_client_window (GtkIMContext *conte
 #else
         GtkStyle        *style_context;
 #endif
+        /* The hidden GtkTextView below is only used to look up themed
+         * selection colors.  Since GTK 4.24 a new GtkTextView sets the
+         * client widget of its own IM context while it is being
+         * constructed, which re-enters this function and creates another
+         * GtkTextView, recursing until the stack overflows (SIGBUS/SIGSEGV
+         * in every GTK4 app with a text entry).  Skip the lookup for the
+         * nested call; that context belongs to the hidden widget and never
+         * receives input. */
+        static gboolean creating_text_view = FALSE;
+
         ibusimcontext->client_window = g_object_ref (client);
 #if !GTK_CHECK_VERSION (3, 98, 4)
         if (!ibusimcontext->use_button_press_event && _use_sync_mode == 0)
             _connect_button_press_event (ibusimcontext, TRUE);
 #endif
-        ibusimcontext->text_view = g_object_ref_sink (gtk_text_view_new ());
+        if (!creating_text_view) {
+            creating_text_view = TRUE;
+            ibusimcontext->text_view =
+                    g_object_ref_sink (gtk_text_view_new ());
+            creating_text_view = FALSE;
 #if GTK_CHECK_VERSION (2, 91, 0)
-        style_context = gtk_widget_get_style_context (ibusimcontext->text_view);
+            style_context =
+                    gtk_widget_get_style_context (ibusimcontext->text_view);
 #else
-        style_context = gtk_widget_get_style (ibusimcontext->text_view);
+            style_context = gtk_widget_get_style (ibusimcontext->text_view);
 #endif
-        ibusimcontext->rgba = ibus_themed_rgba_new (style_context);
+            ibusimcontext->rgba = ibus_themed_rgba_new (style_context);
+        }
     }
 #if GTK_CHECK_VERSION (3, 98, 4)
     if (ibusimcontext->slave)
