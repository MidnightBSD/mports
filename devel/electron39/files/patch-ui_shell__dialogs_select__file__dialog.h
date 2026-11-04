--- ui/shell_dialogs/select_file_dialog.h.orig	2026-04-30 23:40:01.476071000 -0400
+++ ui/shell_dialogs/select_file_dialog.h	2026-04-30 23:40:01.481482000 -0400
@@ -224,7 +224,7 @@
                   const GURL* caller = nullptr);
   bool HasMultipleFileTypeChoices();
 
-#if BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   // Set the label used for the file select button.
   virtual void SetButtonLabel(const std::string& label) = 0;
 
