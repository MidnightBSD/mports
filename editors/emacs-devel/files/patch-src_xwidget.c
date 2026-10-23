Backport of upstream emacs commit 4e855f90d1b (Bug#80728):
xwidgets: re-enable with newer webkit2gtk (>= 2.41.92) by disabling
hardware acceleration.  Drop once GH_TAGNAME includes it.

--- src/xwidget.c.orig	2025-05-15 13:29:27 UTC
+++ src/xwidget.c
@@ -380,6 +380,15 @@
 	  g_object_set (G_OBJECT (settings), "enable-developer-extras", TRUE, NULL);
 	  g_object_set (G_OBJECT (settings), "enable-javascript",
 		        (gboolean) (!xwidget_webkit_disable_javascript), NULL);
+#if WEBKIT_CHECK_VERSION (2, 16, 0)
+	  /* the webkit view is created on an *offscreen* window, on
+	     which hardware acceleration is not supported; we need to
+	     tell webkitgtk _not_ to try that, since it will fail & abort()
+	     with recent versions. */
+
+	  webkit_settings_set_hardware_acceleration_policy
+	    (settings, WEBKIT_HARDWARE_ACCELERATION_POLICY_NEVER);
+#endif
 	}
 
       gtk_widget_set_size_request (GTK_WIDGET (xw->widget_osr), xw->width,
