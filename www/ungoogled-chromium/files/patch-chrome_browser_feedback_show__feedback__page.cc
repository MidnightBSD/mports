--- chrome/browser/feedback/show_feedback_page.cc.orig	2026-10-26 21:13:14 UTC
+++ chrome/browser/feedback/show_feedback_page.cc
@@ -351,7 +351,7 @@
     return false;
   }
 
-#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   if (base::FeatureList::IsEnabled(features::kFeedbackDisabledDialog)) {
     return true;
   }
