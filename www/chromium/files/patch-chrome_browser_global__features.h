--- chrome/browser/global_features.h.orig	2026-10-26 21:13:13 UTC
+++ chrome/browser/global_features.h	2026-10-29 13:14:51 UTC
@@ -26,7 +26,7 @@
 namespace system_permission_settings {
 class PlatformHandle;
 }  // namespace system_permission_settings
-#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
 namespace whats_new {
 class WhatsNewRegistry;
 }  // namespace whats_new
@@ -90,7 +90,7 @@
 class OnDeviceTranslationInstaller;
 }
 
-#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
 namespace scheduled_restart {
 class ScheduledRestartBubbleController;
 class ScheduledRestartManager;
@@ -167,7 +167,7 @@
   system_permissions_platform_handle() {
     return system_permissions_platform_handle_.get();
   }
-#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   whats_new::WhatsNewRegistry* whats_new_registry() {
     return whats_new_registry_.get();
   }
@@ -240,7 +240,7 @@
   }
 #endif  // !BUILDFLAG(IS_ANDROID)
 
-#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   scheduled_restart::ScheduledRestartBubbleController*
   scheduled_restart_bubble_controller() {
     return scheduled_restart_bubble_controller_.get();
@@ -270,12 +270,12 @@
 
   virtual std::unique_ptr<system_permission_settings::PlatformHandle>
   CreateSystemPermissionsPlatformHandle();
-#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   virtual std::unique_ptr<whats_new::WhatsNewRegistry> CreateWhatsNewRegistry();
 #endif
   virtual std::unique_ptr<GlobalBrowserCollection>
   CreateGlobalBrowserCollection();
-#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   virtual std::unique_ptr<scheduled_restart::ScheduledRestartManager>
   CreateScheduledRestartManager();
 #endif
@@ -294,7 +294,7 @@
 
   std::unique_ptr<system_permission_settings::PlatformHandle>
       system_permissions_platform_handle_;
-#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   std::unique_ptr<whats_new::WhatsNewRegistry> whats_new_registry_;
 
   std::unique_ptr<default_browser::DefaultBrowserManager>
@@ -359,7 +359,7 @@
   std::unique_ptr<smart_restart::SmartRestartManager> smart_restart_manager_;
 #endif  // !BUILDFLAG(IS_ANDROID)
 
-#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   std::unique_ptr<scheduled_restart::ScheduledRestartBubbleController>
       scheduled_restart_bubble_controller_;
   std::unique_ptr<scheduled_restart::ScheduledRestartManager>
