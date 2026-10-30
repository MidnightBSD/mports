--- services/device/geolocation/location_provider_manager.cc.orig	2026-10-26 21:13:13 UTC
+++ services/device/geolocation/location_provider_manager.cc
@@ -92,7 +92,7 @@
 #if BUILDFLAG(IS_ANDROID) || BUILDFLAG(IS_IOS)
   // On Android and iOS, default to using the platform location provider.
   provider_manager_mode_ = kPlatformOnly;
-#elif BUILDFLAG(IS_CHROMEOS)
+#elif BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_BSD)
   // On Ash / Lacros, default to using the network location provider.
   provider_manager_mode_ = kNetworkOnly;
 #else
