--- components/web_package/signed_web_bundles/ecdsa_p256_sha256_signature.cc.orig	2026-10-26 21:13:13 UTC
+++ components/web_package/signed_web_bundles/ecdsa_p256_sha256_signature.cc
@@ -9,7 +9,7 @@
 #include "base/strings/stringprintf.h"
 #include "base/types/expected.h"
 #include "components/web_package/signed_web_bundles/ecdsa_p256_public_key.h"
-#include "components/web_package/signed_web_bundles/rust/signed_web_bundles_rust.h"
+#include "components/web_package/signed_web_bundles/rust/bridge.h"
 
 namespace web_package {
 
