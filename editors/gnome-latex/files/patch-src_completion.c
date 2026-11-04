--- src/completion.c.orig
+++ src/completion.c
@@ -78,0 +79,20 @@
+
+static gchar *
+get_line_indentation (const GtkTextIter *iter)
+{
+	GtkTextIter start = *iter;
+	GtkTextIter end = *iter;
+
+	gtk_text_iter_set_line_offset (&start, 0);
+	while (!gtk_text_iter_equal (&end, &start))
+	{
+		gunichar ch = gtk_text_iter_get_char (&end);
+
+		if (ch != ' ' && ch != '\t')
+			break;
+
+		gtk_text_iter_forward_char (&end);
+	}
+
+	return gtk_text_iter_get_text (&start, &end);
+}
@@ -1690 +1710 @@
-	_tmp3_ = tepl_iter_get_line_indentation (&_tmp2_);
+	_tmp3_ = get_line_indentation (&_tmp2_);
