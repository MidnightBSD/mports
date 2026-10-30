--- chrome/browser/private_verification_tokens/private_verification_tokens_service_unittest.cc.orig	2026-10-26 21:13:13 UTC
+++ chrome/browser/private_verification_tokens/private_verification_tokens_service_unittest.cc
@@ -42,7 +42,6 @@
 #include "testing/gmock/include/gmock/gmock.h"
 #include "testing/gtest/include/gtest/gtest.h"
 #include "third_party/blink/public/common/storage_key/storage_key.h"
-#include "third_party/crubit/support/rs_std/slice_ref.h"
 #include "url/gurl.h"
 #include "url/origin.h"
 
@@ -893,7 +892,7 @@
         }
 
         auto response = test_issuer().issue_batch_from_bytes(
-            rs_std::SliceRef<const uint8_t>(base::as_byte_span(request_body)),
+            base::span<const uint8_t>(base::as_byte_span(request_body)),
             /*hidden_metadata=*/0);
         ASSERT_TRUE(response.has_value());
         test_url_loader_factory.AddResponse(
@@ -1007,7 +1006,7 @@
           }
         }
         auto response = test_issuer().issue_batch_from_bytes(
-            rs_std::SliceRef<const uint8_t>(base::as_byte_span(request_body)),
+            base::span<const uint8_t>(base::as_byte_span(request_body)),
             /*hidden_metadata=*/0);
         ASSERT_TRUE(response.has_value());
         test_url_loader_factory.AddResponse(
@@ -1098,7 +1097,7 @@
           }
         }
         auto response = test_issuer().issue_batch_from_bytes(
-            rs_std::SliceRef<const uint8_t>(base::as_byte_span(request_body)),
+            base::span<const uint8_t>(base::as_byte_span(request_body)),
             /*hidden_metadata=*/0);
         ASSERT_TRUE(response.has_value());
         test_url_loader_factory.AddResponse(
@@ -1268,7 +1267,7 @@
           }
         }
         auto response = test_issuer().issue_batch_from_bytes(
-            rs_std::SliceRef<const uint8_t>(base::as_byte_span(request_body)),
+            base::span<const uint8_t>(base::as_byte_span(request_body)),
             /*hidden_metadata=*/0);
         ASSERT_TRUE(response.has_value());
         test_url_loader_factory.AddResponse(
