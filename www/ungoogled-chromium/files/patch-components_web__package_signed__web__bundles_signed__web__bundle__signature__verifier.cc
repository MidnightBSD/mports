--- components/web_package/signed_web_bundles/signed_web_bundle_signature_verifier.cc.orig	2026-10-26 21:13:13 UTC
+++ components/web_package/signed_web_bundles/signed_web_bundle_signature_verifier.cc
@@ -22,7 +22,7 @@
 #include "base/types/expected_macros.h"
 #include "components/web_package/signed_web_bundles/identity_validator.h"
 #include "components/web_package/signed_web_bundles/integrity_block_parser.h"
-#include "components/web_package/signed_web_bundles/rust/signed_web_bundles_rust.h"
+#include "components/web_package/signed_web_bundles/rust/bridge.h"
 #include "components/web_package/signed_web_bundles/signed_web_bundle_id.h"
 #include "components/web_package/signed_web_bundles/signed_web_bundle_integrity_block.h"
 #include "components/web_package/signed_web_bundles/signed_web_bundle_signature_stack.h"
