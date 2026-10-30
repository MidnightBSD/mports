--- chrome/browser/ui/webui/infobar_internals/infobar_internals_handler.cc.orig	2026-10-26 21:13:14 UTC
+++ chrome/browser/ui/webui/infobar_internals/infobar_internals_handler.cc
@@ -93,7 +93,7 @@
 #include "chrome/browser/ui/cocoa/keystone_infobar_delegate.h"
 #endif
 
-#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
 #include "chrome/browser/ui/startup/default_browser_prompt/default_browser_prompt_manager.h"  // nogncheck
 #include "chrome/browser/ui/startup/default_browser_prompt/default_browser_prompt_prefs.h"  // nogncheck
 #include "chrome/browser/ui/views/session_restore_infobar/session_restore_infobar_manager.h"
@@ -149,7 +149,7 @@
       return {.profile = true, .web_contents = true};
 #endif
     case InfoBarType::kExtensionDevTools:
-#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
     case InfoBarType::kDefaultBrowser:
     case InfoBarType::kEnableLinkCapturing:
     case InfoBarType::kSessionRestore:
@@ -244,7 +244,7 @@
             "The Collected Cookies infobar is shown after the user has changed "
             "the allowed/blocked state of a cookie, reminding them to reload "
             "the page in order for the new cookies to take effect.");
-#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   add_entry(InfoBarType::kDefaultBrowser, "Default Browser",
             "The Default Browser infobar asks the user if they want to set "
             "Chrome as their default browser. This trigger resets any browser "
@@ -461,7 +461,7 @@
       }
       return true;
     }
-#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
     case InfoBarType::kDefaultBrowser: {
       chrome::startup::default_prompt::ResetPromptPrefs(profile);
       DefaultBrowserPromptManager::GetInstance()->MaybeShowPrompt();
