--- components/private_verification_tokens/common/privacy_pass_athm_batch_request.cc.orig	2026-10-26 21:13:13 UTC
+++ components/private_verification_tokens/common/privacy_pass_athm_batch_request.cc
@@ -9,7 +9,6 @@
 
 #include "base/containers/to_vector.h"
 #include "components/private_verification_tokens/common/athm_ffi/athm_ffi.h"
-#include "third_party/crubit/support/rs_std/slice_ref.h"
 
 namespace private_verification_tokens {
 
@@ -27,11 +26,11 @@
   }
 
   auto client_result = PrivacyPassBatchClient::try_new(
-      rs_std::SliceRef<const uint8_t>(issuer_config.public_key.public_key()),
-      rs_std::SliceRef<const uint8_t>(
+      base::span<const uint8_t>(issuer_config.public_key.public_key()),
+      base::span<const uint8_t>(
           issuer_config.public_key.public_key_proof()),
       num_buckets,
-      rs_std::SliceRef<const uint8_t>(
+      base::span<const uint8_t>(
           base::as_byte_span(issuer_config.deployment_id)),
       issuer_config.public_key.version(),
       static_cast<size_t>(issuer_config.batch_size));
@@ -46,7 +45,7 @@
 PrivacyPassAthmBatchRequest::PrivacyPassAthmBatchRequest(
     PrivacyPassBatchClient batch_client)
     : batch_client_(std::move(batch_client)),
-      request_body_(base::ToVector(batch_client_->request_body().to_span())) {}
+      request_body_(base::ToVector(batch_client_->request_body())) {}
 
 PrivacyPassAthmBatchRequest::PrivacyPassAthmBatchRequest(
     PrivacyPassAthmBatchRequest&&) = default;
@@ -64,9 +63,9 @@
 
   auto finalize_result =
       std::exchange(batch_client_, std::nullopt)
-          ->finalize(rs_std::SliceRef<const uint8_t>(response_body));
+          ->finalize(base::span<const uint8_t>(response_body));
   if (!finalize_result.has_value()) {
-    if (finalize_result.error() == AthmStatus::MakeInvalidInput()) {
+    if (finalize_result.error() == AthmStatus::InvalidInput) {
       return base::unexpected(
           PrivacyPassAthmBatchRequestError::kInvalidResponseBodyLength);
     }
