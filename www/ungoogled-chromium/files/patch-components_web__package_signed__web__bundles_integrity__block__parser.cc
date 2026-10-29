--- components/web_package/signed_web_bundles/integrity_block_parser.cc.orig	2026-10-26 21:13:13 UTC
+++ components/web_package/signed_web_bundles/integrity_block_parser.cc
@@ -22,7 +22,7 @@
 #include "components/web_package/signed_web_bundles/ed25519_public_key.h"
 #include "components/web_package/signed_web_bundles/ed25519_signature.h"
 #include "components/web_package/signed_web_bundles/integrity_block_attributes.h"
-#include "components/web_package/signed_web_bundles/rust/signed_web_bundles_rust.h"
+#include "components/web_package/signed_web_bundles/rust/bridge.h"
 #include "components/web_package/signed_web_bundles/signed_web_bundle_id.h"
 #include "components/web_package/signed_web_bundles/types.h"
 
@@ -41,18 +41,18 @@
   switch (entry.signature_type.tag) {
     case SignatureType::Ed25519: {
       ASSIGN_OR_RETURN(auto public_key,
-                       Ed25519PublicKey::Create(entry.public_key.to_span()));
+                       Ed25519PublicKey::Create(base::span(entry.public_key)));
       ASSIGN_OR_RETURN(auto signature,
-                       Ed25519Signature::Create(entry.signature.to_span()));
+                       Ed25519Signature::Create(base::span(entry.signature)));
       parsed_sig->signature_info = mojom::SignatureInfo::NewEd25519(
           mojom::SignatureInfoEd25519::New(public_key, signature));
       break;
     }
     case SignatureType::EcdsaP256SHA256: {
       ASSIGN_OR_RETURN(auto public_key,
-                       EcdsaP256PublicKey::Create(entry.public_key.to_span()));
+                       EcdsaP256PublicKey::Create(base::span(entry.public_key)));
       ASSIGN_OR_RETURN(auto signature, EcdsaP256SHA256Signature::Create(
-                                           entry.signature.to_span()));
+                                           base::span(entry.signature)));
       parsed_sig->signature_info = mojom::SignatureInfo::NewEcdsaP256Sha256(
           mojom::SignatureInfoEcdsaP256SHA256::New(public_key, signature));
       break;
@@ -107,7 +107,7 @@
   const auto parse_res = parse_integrity_block(*data);
   if (!parse_res.has_value()) {
     const auto& error = parse_res.error();
-    RunErrorCallback(std::string(error.message.as_str()),
+    RunErrorCallback(std::string(error.message),
                      error.is_version_error
                          ? mojom::BundleParseErrorType::kVersionError
                          : mojom::BundleParseErrorType::kFormatError);
@@ -119,7 +119,7 @@
   integrity_block->size = parsed_ib.size;
 
   const std::string_view web_bundle_id_str =
-      parsed_ib.web_bundle_id.to_string_view();
+      parsed_ib.web_bundle_id;
   RETURN_IF_ERROR(
       SignedWebBundleId::Create(web_bundle_id_str),
       [&](std::string error) { RunErrorCallback(std::move(error)); });
