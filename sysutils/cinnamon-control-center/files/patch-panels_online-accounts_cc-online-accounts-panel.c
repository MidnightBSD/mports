--- panels/online-accounts/cc-online-accounts-panel.c.orig	2022-07-04 07:39:25 UTC
+++ panels/online-accounts/cc-online-accounts-panel.c
@@ -234,0 +235,26 @@ show_non_branded_providers (CcGoaPanel *self)
+static void
+add_account_cb (GoaProvider  *provider,
+                GAsyncResult *res,
+                gpointer      user_data)
+{
+  CcGoaPanel *self = CC_GOA_PANEL (user_data);
+  GoaObject *object;
+  GError *error;
+
+  error = NULL;
+  object = goa_provider_add_account_finish (provider, res, &error);
+  if (object == NULL)
+    {
+      if (error != NULL)
+        {
+          g_warning ("Error adding online account: %s", error->message);
+          g_error_free (error);
+        }
+      gtk_widget_hide (self->edit_account_dialog);
+    }
+  else
+    show_page_account (self, object);
+
+  g_object_unref (self);
+}
+
@@ -241,4 +267,0 @@ add_account (CcGoaPanel  *self,
-  GoaObject *object;
-  GError *error;
-
-  error = NULL;
@@ -261,14 +283,8 @@ add_account (CcGoaPanel  *self,
-  /* This spins gtk_dialog_run() */
-  object = goa_provider_add_account (provider,
-                                     self->client,
-                                     GTK_DIALOG (self->edit_account_dialog),
-                                     GTK_BOX (self->new_account_vbox),
-                                     &error);
-
   if (preseed)
     goa_provider_set_preseed_data (provider, preseed);
-
-  if (object == NULL)
-    gtk_widget_hide (self->edit_account_dialog);
-  else
-    show_page_account (self, object);
+  goa_provider_add_account (provider,
+                            self->client,
+                            GTK_WIDGET (self->edit_account_dialog),
+                            NULL,
+                            (GAsyncReadyCallback) add_account_cb,
+                            g_object_ref (self));
@@ -585,3 +602,4 @@ show_page_account (CcGoaPanel  *panel,
-                                 GTK_BOX (panel->accounts_vbox),
+                                 GTK_WIDGET (panel->accounts_vbox),
                                  NULL,
-                                 NULL);
+                                 NULL,
+                                 NULL);
