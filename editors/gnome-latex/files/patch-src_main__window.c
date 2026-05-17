--- src/main_window.c.orig
+++ src/main_window.c
@@ -252 +252 @@
-	TeplPanel* _side_panel;
+	TeplPanel1* _side_panel;
@@ -450 +450 @@
-static TeplPanel* main_window_get_side_panel (MainWindow* self);
+static TeplPanel1* main_window_get_side_panel (MainWindow* self);
@@ -910 +910 @@
-	TeplPanel* _tmp32_;
+	TeplPanel1* _tmp32_;
@@ -912 +912 @@
-	TeplPanel* _tmp34_;
+	TeplPanel1* _tmp34_;
@@ -1442 +1442 @@
-static TeplPanel*
+static TeplPanel1*
@@ -1445,2 +1445,2 @@
-	TeplPanel* side_panel = NULL;
-	TeplPanel* _tmp0_;
+	TeplPanel1* side_panel = NULL;
+	TeplPanel1* _tmp0_;
@@ -1460 +1460 @@
-	TeplPanel* result = NULL;
+	TeplPanel1* result = NULL;
@@ -1462 +1462 @@
-	_tmp0_ = tepl_panel_new_for_left_side_panel ();
+	_tmp0_ = tepl_panel1_new_for_left_side_panel ();
@@ -1468 +1468 @@
-	tepl_panel_add_component (side_panel, (GtkWidget*) symbols, "symbols", _ ("Symbols"), "symbol_greek");
+	tepl_panel1_add_component (side_panel, (GtkWidget*) symbols, "symbols", _ ("Symbols"), "symbol_greek");
@@ -1472 +1472 @@
-	tepl_panel_add_component (side_panel, (GtkWidget*) file_browser, "file-browser", _ ("File Browser"), "document-open");
+	tepl_panel1_add_component (side_panel, (GtkWidget*) file_browser, "file-browser", _ ("File Browser"), "document-open");
@@ -1478 +1478 @@
-	tepl_panel_add_component (side_panel, (GtkWidget*) structure, "structure", _ ("Structure"), GTK_STOCK_INDEX);
+	tepl_panel1_add_component (side_panel, (GtkWidget*) structure, "structure", _ ("Structure"), GTK_STOCK_INDEX);
@@ -1481,2 +1481,2 @@
-	tepl_panel_provide_active_component_gsetting (side_panel, settings, "side-panel-component");
-	tepl_panel_restore_state_from_gsettings (side_panel);
+	tepl_panel1_provide_active_component_gsetting (side_panel, settings, "side-panel-component");
+	tepl_panel1_restore_state_from_gsettings (side_panel);
@@ -2802 +2802 @@
-	TeplPanel* _tmp33_;
+	TeplPanel1* _tmp33_;
@@ -2859 +2859 @@
-	tepl_panel_save_state_to_gsettings (_tmp33_);
+	tepl_panel1_save_state_to_gsettings (_tmp33_);
