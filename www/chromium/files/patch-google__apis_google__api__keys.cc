--- google_apis/google_api_keys.cc.orig	2026-10-26 21:13:14 UTC
+++ google_apis/google_api_keys.cc
@@ -16,6 +16,10 @@
 #include "google_apis/api_key_cache.h"
 #include "google_apis/buildflags.h"
 #include "google_apis/default_api_keys.h"
+
+#if BUILDFLAG(IS_BSD)
+#include "google_apis/environment_api_key.h"
+#endif
 
 #if defined(USE_OFFICIAL_GOOGLE_API_KEYS)
 #include "google_apis/internal/google_chrome_api_keys.h"
