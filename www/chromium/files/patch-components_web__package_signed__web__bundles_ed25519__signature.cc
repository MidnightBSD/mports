--- components/web_package/signed_web_bundles/ed25519_signature.cc.orig	2026-10-26 21:13:13 UTC
+++ components/web_package/signed_web_bundles/ed25519_signature.cc
@@ -7,7 +7,7 @@
 #include <algorithm>
 
 #include "base/strings/stringprintf.h"
-#include "components/web_package/signed_web_bundles/rust/signed_web_bundles_rust.h"
+#include "components/web_package/signed_web_bundles/rust/bridge.h"
 #include "third_party/boringssl/src/include/openssl/curve25519.h"
 
 namespace web_package {
