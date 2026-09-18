--- gitg/gitg-result-dialog.vala.orig	2026-09-18 16:14:16 UTC
+++ gitg/gitg-result-dialog.vala
@@ -93 +93 @@
-			int escpos = s.index_of ("\u001b", p);
+			int escpos = s.index_of ("\x1b", p);
@@ -150 +150 @@
-				insert_with_tag ("\u001b", bold, underline, fg);
+				insert_with_tag ("\x1b", bold, underline, fg);
