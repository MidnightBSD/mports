Index: yelp-window.c
===================================================================
--- src/yelp-window.c	(révision 3120)
+++ src/yelp-window.c	(copie de travail)
@@ -1140,10 +1140,10 @@ window_error (YelpWindow *window, gchar 
 	 GTK_DIALOG_MODAL | GTK_DIALOG_DESTROY_WITH_PARENT,
 	 GTK_MESSAGE_ERROR,
 	 GTK_BUTTONS_OK,
-	 title);
+	 "%s", title);
     gtk_message_dialog_format_secondary_markup
-	(GTK_MESSAGE_DIALOG (dialog), message);
-	 gtk_dialog_run (GTK_DIALOG (dialog));
+	(GTK_MESSAGE_DIALOG (dialog), "%s", message);
+    gtk_dialog_run (GTK_DIALOG (dialog));
 
     gtk_widget_destroy (dialog);
 }
