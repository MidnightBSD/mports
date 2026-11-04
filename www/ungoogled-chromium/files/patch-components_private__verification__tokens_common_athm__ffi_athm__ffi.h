--- components/private_verification_tokens/common/athm_ffi/athm_ffi.h.orig	2026-10-29 03:26:48 UTC
+++ components/private_verification_tokens/common/athm_ffi/athm_ffi.h
@@ -0,0 +1,113 @@
+// Copyright 2026 The Chromium Authors
+// Use of this source code is governed by a BSD-style license that can be
+// found in the LICENSE file.
+
+#ifndef COMPONENTS_PRIVATE_VERIFICATION_TOKENS_COMMON_ATHM_FFI_ATHM_FFI_H_
+#define COMPONENTS_PRIVATE_VERIFICATION_TOKENS_COMMON_ATHM_FFI_ATHM_FFI_H_
+
+#include <cstdint>
+#include <utility>
+#include <vector>
+
+#include "base/containers/span.h"
+#include "base/types/expected.h"
+#include "components/private_verification_tokens/common/athm_ffi/cxx_bridge.rs.h"
+
+namespace private_verification_tokens {
+
+enum class AthmStatus : uint8_t { InvalidInput = 1, OperationFailed = 2 };
+
+inline rust::Slice<const uint8_t> AthmSlice(base::span<const uint8_t> bytes) {
+  return {bytes.data(), bytes.size()};
+}
+
+class PrivacyPassBatchClient {
+ public:
+  static base::expected<PrivacyPassBatchClient, AthmStatus> try_new(
+      base::span<const uint8_t> public_key,
+      base::span<const uint8_t> public_key_proof,
+      uint8_t num_buckets,
+      base::span<const uint8_t> deployment_id,
+      uint32_t version,
+      size_t batch_size) {
+    auto result = ffi::client_new(
+        AthmSlice(public_key), AthmSlice(public_key_proof), num_buckets,
+        AthmSlice(deployment_id), version, batch_size);
+    if (result.status != 0) {
+      return base::unexpected(static_cast<AthmStatus>(result.status));
+    }
+    return PrivacyPassBatchClient(std::move(result.client));
+  }
+
+  base::span<const uint8_t> request_body() const {
+    auto bytes = client_->request_body();
+    return {bytes.data(), bytes.size()};
+  }
+
+  base::expected<std::vector<std::vector<uint8_t>>, AthmStatus> finalize(
+      base::span<const uint8_t> response_body) {
+    auto result = client_->finalize(AthmSlice(response_body));
+    if (result.status != 0) {
+      return base::unexpected(static_cast<AthmStatus>(result.status));
+    }
+    std::vector<std::vector<uint8_t>> tokens;
+    tokens.reserve(result.tokens.size());
+    for (const auto& token : result.tokens) {
+      tokens.emplace_back(token.bytes.begin(), token.bytes.end());
+    }
+    return tokens;
+  }
+
+ private:
+  explicit PrivacyPassBatchClient(rust::Box<ffi::ClientHandle> client)
+      : client_(std::move(client)) {}
+  rust::Box<ffi::ClientHandle> client_;
+};
+
+class PrivacyPassAthmIssuer {
+ public:
+  static base::expected<PrivacyPassAthmIssuer, AthmStatus> try_new(
+      uint8_t num_buckets,
+      base::span<const uint8_t> deployment_id) {
+    auto result = ffi::issuer_new(num_buckets, AthmSlice(deployment_id));
+    if (result.status != 0) {
+      return base::unexpected(static_cast<AthmStatus>(result.status));
+    }
+    return PrivacyPassAthmIssuer(std::move(result.issuer));
+  }
+
+  std::vector<uint8_t> public_key_bytes() const {
+    auto bytes = issuer_->public_key_bytes();
+    return {bytes.begin(), bytes.end()};
+  }
+  std::vector<uint8_t> public_key_proof_bytes() const {
+    auto bytes = issuer_->public_key_proof_bytes();
+    return {bytes.begin(), bytes.end()};
+  }
+  base::expected<std::vector<uint8_t>, AthmStatus> issue_batch_from_bytes(
+      base::span<const uint8_t> request,
+      uint8_t metadata) const {
+    auto result = issuer_->issue_batch_from_bytes(AthmSlice(request), metadata);
+    if (result.status != 0) {
+      return base::unexpected(static_cast<AthmStatus>(result.status));
+    }
+    return std::vector<uint8_t>(result.bytes.begin(), result.bytes.end());
+  }
+  base::expected<uint8_t, AthmStatus> verify_wire_token(
+      base::span<const uint8_t> token) const {
+    auto result = issuer_->verify_wire_token(AthmSlice(token));
+    if (result.status != 0) {
+      return base::unexpected(static_cast<AthmStatus>(result.status));
+    }
+    return result.metadata;
+  }
+
+ private:
+  explicit PrivacyPassAthmIssuer(rust::Box<ffi::IssuerHandle> issuer)
+      : issuer_(std::move(issuer)) {}
+  rust::Box<ffi::IssuerHandle> issuer_;
+};
+
+}  // namespace private_verification_tokens
+
+#endif  // COMPONENTS_PRIVATE_VERIFICATION_TOKENS_COMMON_ATHM_FFI_ATHM_FFI_H_
