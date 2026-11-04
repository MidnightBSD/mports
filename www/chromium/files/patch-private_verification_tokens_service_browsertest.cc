--- chrome/browser/private_verification_tokens/private_verification_tokens_service_browsertest.cc.orig	2026-10-26 21:13:13 UTC
+++ chrome/browser/private_verification_tokens/private_verification_tokens_service_browsertest.cc
@@ -37,7 +37,6 @@
 #include "net/test/embedded_test_server/http_response.h"
 #include "testing/gmock/include/gmock/gmock.h"
 #include "testing/gtest/include/gtest/gtest.h"
-#include "third_party/crubit/support/rs_std/slice_ref.h"
 #include "url/gurl.h"
 #include "url/origin.h"
 
@@ -179,7 +178,7 @@
       if (decoded.has_value()) {
         redemption_count_++;
         auto metadata = test_issuer_->verify_wire_token(
-            rs_std::SliceRef<const uint8_t>(*decoded));
+            base::span<const uint8_t>(*decoded));
         last_recovered_metadata_ =
             metadata.has_value() ? std::make_optional(*metadata) : std::nullopt;
       }
@@ -208,7 +207,7 @@
         last_issuance_request_accept_ = accept_it->second;
       }
       auto batch_response = test_issuer_->issue_batch_from_bytes(
-          rs_std::SliceRef<const uint8_t>(base::as_byte_span(request.content)),
+          base::span<const uint8_t>(base::as_byte_span(request.content)),
           /*hidden_metadata=*/0);
       auto response = std::make_unique<net::test_server::BasicHttpResponse>();
       response->set_code(net::HTTP_OK);
