--- src/factory.c.orig
+++ src/factory.c
@@ -115,2 +115 @@
-static void factory_real_fill_prefs_dialog (TeplAbstractFactory* base,
-                                     TeplPrefsDialog* dialog);
+static TeplPrefsDialog* factory_real_create_prefs_dialog (TeplAbstractFactory* base);
@@ -296,3 +295,2 @@
-static void
-factory_real_fill_prefs_dialog (TeplAbstractFactory* base,
-                                TeplPrefsDialog* dialog)
+static TeplPrefsDialog*
+factory_real_create_prefs_dialog (TeplAbstractFactory* base)
@@ -300,0 +299 @@
+	TeplPrefsDialog* dialog;
@@ -302 +301 @@
-	g_return_if_fail (dialog != NULL);
+	dialog = tepl_prefs_dialog_new ();
@@ -303,0 +303 @@
+	return dialog;
@@ -312 +312 @@
-	((TeplAbstractFactoryClass *) klass)->fill_prefs_dialog = (void (*) (TeplAbstractFactory*, TeplPrefsDialog*)) factory_real_fill_prefs_dialog;
+	((TeplAbstractFactoryClass *) klass)->create_prefs_dialog = (TeplPrefsDialog* (*) (TeplAbstractFactory*)) factory_real_create_prefs_dialog;
