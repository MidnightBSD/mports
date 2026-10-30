--- chrome/browser/ui/autofill/chrome_autofill_client.cc.orig	2026-10-29 00:40:25 UTC
+++ chrome/browser/ui/autofill/chrome_autofill_client.cc
@@ -386,7 +386,7 @@
 }
 
 #if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX) || \
-    BUILDFLAG(IS_CHROMEOS)
+    BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_BSD)
 void ChromeAutofillClient::ShowAutofillAtMemoryPromo() {
   // TODO(crbug.com/519061643) Double check if we also need to check a field
   // url here.
