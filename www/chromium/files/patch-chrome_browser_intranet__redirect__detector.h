--- chrome/browser/intranet_redirect_detector.h.orig	2026-10-26 21:13:13 UTC
+++ chrome/browser/intranet_redirect_detector.h
@@ -26,7 +26,7 @@
 class PrefRegistrySimple;
 
 #if !(BUILDFLAG(IS_MAC) || BUILDFLAG(IS_WIN) || BUILDFLAG(IS_LINUX) || \
-      BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_ANDROID))
+      BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_ANDROID) || BUILDFLAG(IS_BSD))
 #error \
     "IntranetRedirectDetector should only be built on Desktop platforms " \
     "and Android."
