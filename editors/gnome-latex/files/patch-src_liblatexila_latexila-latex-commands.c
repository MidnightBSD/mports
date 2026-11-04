--- src/liblatexila/latexila-latex-commands.c.orig
+++ src/liblatexila/latexila-latex-commands.c
@@ -31,0 +32,20 @@
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
@@ -494 +514 @@
-		current_indent = tepl_iter_get_line_indentation (&selection_start);
+		current_indent = get_line_indentation (&selection_start);
