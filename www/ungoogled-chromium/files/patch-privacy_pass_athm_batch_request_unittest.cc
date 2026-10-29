--- components/private_verification_tokens/common/privacy_pass_athm_batch_request_unittest.cc.orig	2026-10-26 21:13:13 UTC
+++ components/private_verification_tokens/common/privacy_pass_athm_batch_request_unittest.cc
@@ -20,7 +20,6 @@
 #include "components/private_verification_tokens/common/private_verification_tokens_public_key.h"
 #include "testing/gmock/include/gmock/gmock.h"
 #include "testing/gtest/include/gtest/gtest.h"
-#include "third_party/crubit/support/rs_std/slice_ref.h"
 #include "url/gurl.h"
 #include "url/origin.h"
 
@@ -52,14 +51,14 @@
     uint8_t expected_metadata) {
   EXPECT_EQ(finalized_token_bytes.size(), kSingleTokenSize);
   auto recovered_metadata = issuer.verify_wire_token(
-      rs_std::SliceRef<const uint8_t>(finalized_token_bytes));
+      base::span<const uint8_t>(finalized_token_bytes));
   ASSERT_TRUE(recovered_metadata.has_value());
   EXPECT_EQ(*recovered_metadata, expected_metadata);
 }
 
 TEST(PrivacyPassAthmBatchRequestTest, RoundtripBatchIssuance) {
   auto issuer = PrivacyPassAthmIssuer::try_new(
-      kNumBuckets, rs_std::SliceRef<const uint8_t>(DeploymentIdBytes()));
+      kNumBuckets, base::span<const uint8_t>(DeploymentIdBytes()));
   ASSERT_TRUE(issuer.has_value());
 
   constexpr int32_t kBatchSize = 10;
@@ -81,7 +80,7 @@
 
   const uint8_t hidden_metadata = 1;
   auto batch_response = issuer->issue_batch_from_bytes(
-      rs_std::SliceRef<const uint8_t>(batch_request->request_body()),
+      base::span<const uint8_t>(batch_request->request_body()),
       hidden_metadata);
   ASSERT_TRUE(batch_response.has_value());
 
@@ -104,7 +103,7 @@
 
 TEST(PrivacyPassAthmBatchRequestTest, InvalidBatchParameters) {
   auto issuer = PrivacyPassAthmIssuer::try_new(
-      kNumBuckets, rs_std::SliceRef<const uint8_t>(DeploymentIdBytes()));
+      kNumBuckets, base::span<const uint8_t>(DeploymentIdBytes()));
   ASSERT_TRUE(issuer.has_value());
 
   // Zero batch size.
@@ -134,7 +133,7 @@
 
 TEST(PrivacyPassAthmBatchRequestTest, SingleUseFinalization) {
   auto issuer = PrivacyPassAthmIssuer::try_new(
-      kNumBuckets, rs_std::SliceRef<const uint8_t>(DeploymentIdBytes()));
+      kNumBuckets, base::span<const uint8_t>(DeploymentIdBytes()));
   ASSERT_TRUE(issuer.has_value());
 
   IssuerConfig issuer_config =
@@ -154,7 +153,7 @@
       issuer_config.public_key.version());
 
   auto token_resp = issuer->issue_batch_from_bytes(
-      rs_std::SliceRef<const uint8_t>(batch_request->request_body()),
+      base::span<const uint8_t>(batch_request->request_body()),
       /*hidden_metadata=*/1);
   ASSERT_TRUE(token_resp.has_value());
 
@@ -172,7 +171,7 @@
 
 TEST(PrivacyPassAthmBatchRequestTest, MalformedResponseBody) {
   auto issuer = PrivacyPassAthmIssuer::try_new(
-      kNumBuckets, rs_std::SliceRef<const uint8_t>(DeploymentIdBytes()));
+      kNumBuckets, base::span<const uint8_t>(DeploymentIdBytes()));
   ASSERT_TRUE(issuer.has_value());
 
   IssuerConfig issuer_config =
