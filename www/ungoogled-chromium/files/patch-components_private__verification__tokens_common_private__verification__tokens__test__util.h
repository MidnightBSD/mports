--- components/private_verification_tokens/common/private_verification_tokens_test_util.h.orig	2026-10-26 21:13:13 UTC
+++ components/private_verification_tokens/common/private_verification_tokens_test_util.h
@@ -14,7 +14,6 @@
 #include "base/strings/string_number_conversions.h"
 #include "base/time/time.h"
 #include "components/private_verification_tokens/common/athm_ffi/athm_ffi.h"
-#include "third_party/crubit/support/rs_std/slice_ref.h"
 
 namespace private_verification_tokens::test {
 
@@ -36,7 +35,7 @@
     std::string_view deployment_id) {
   auto res = PrivacyPassAthmIssuer::try_new(
       num_buckets,
-      rs_std::SliceRef<const uint8_t>(base::as_byte_span(deployment_id)));
+      base::span<const uint8_t>(base::as_byte_span(deployment_id)));
   if (res.has_value()) {
     return std::move(*res);
   }
