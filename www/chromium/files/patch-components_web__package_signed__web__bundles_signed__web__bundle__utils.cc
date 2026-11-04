--- components/web_package/signed_web_bundles/signed_web_bundle_utils.cc.orig	2026-10-26 21:13:13 UTC
+++ components/web_package/signed_web_bundles/signed_web_bundle_utils.cc
@@ -7,7 +7,7 @@
 #include <cstdint>
 #include <vector>
 
-#include "components/web_package/signed_web_bundles/rust/signed_web_bundles_rust.h"
+#include "components/web_package/signed_web_bundles/rust/bridge.h"
 
 namespace web_package {
 
