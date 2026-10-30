--- components/web_package/signed_web_bundles/rust/bridge.h.orig	2026-10-29 03:26:48 UTC
+++ components/web_package/signed_web_bundles/rust/bridge.h
@@ -0,0 +1,96 @@
+// BSD-style license; see LICENSE.
+#ifndef COMPONENTS_WEB_PACKAGE_SIGNED_WEB_BUNDLES_RUST_BRIDGE_H_
+#define COMPONENTS_WEB_PACKAGE_SIGNED_WEB_BUNDLES_RUST_BRIDGE_H_
+#include <algorithm>
+#include <array>
+#include <string>
+#include <vector>
+
+#include "base/check.h"
+#include "base/containers/span.h"
+#include "base/types/expected.h"
+#include "components/web_package/signed_web_bundles/rust/bridge.rs.h"
+namespace web_package::signed_web_bundles::rust {
+inline ::rust::Slice<const uint8_t> Slice(base::span<const uint8_t> data) {
+  return {data.data(), data.size()};
+}
+struct ParseError {
+  bool is_version_error;
+  std::string message;
+};
+struct SignatureType {
+  enum Tag { Ed25519 = 0, EcdsaP256SHA256 = 1, Unknown = 2 };
+  Tag tag;
+};
+struct SignatureStackEntry {
+  std::vector<uint8_t> attributes_cbor;
+  SignatureType signature_type;
+  std::vector<uint8_t> public_key;
+  std::vector<uint8_t> signature;
+};
+struct IntegrityBlock {
+  size_t size;
+  std::string web_bundle_id;
+  std::vector<uint8_t> attributes_cbor;
+  std::vector<SignatureStackEntry> signature_stack;
+};
+inline base::expected<IntegrityBlock, ParseError> parse_integrity_block(
+    base::span<const uint8_t> data) {
+  auto r = ffi::parse_integrity_block(Slice(data));
+  if (!r.ok) {
+    return base::unexpected(
+        ParseError{r.is_version_error, std::string(r.error_message)});
+  }
+  IntegrityBlock out{r.size,
+                     std::string(r.web_bundle_id),
+                     {r.attributes_cbor.begin(), r.attributes_cbor.end()},
+                     {}};
+  for (auto& v : r.signature_stack) {
+    out.signature_stack.push_back(
+        {{v.attributes_cbor.begin(), v.attributes_cbor.end()},
+         {static_cast<SignatureType::Tag>(v.signature_type)},
+         {v.public_key.begin(), v.public_key.end()},
+         {v.signature.begin(), v.signature.end()}});
+  }
+  return out;
+}
+inline auto create_empty_integrity_block_cbor(
+    base::span<const uint8_t> attributes) {
+  return ffi::create_empty_integrity_block_cbor(Slice(attributes));
+}
+inline auto create_signature_payload(base::span<const uint8_t> hash,
+                                     base::span<const uint8_t> block,
+                                     base::span<const uint8_t> attributes) {
+  return ffi::create_signature_payload(Slice(hash), Slice(block),
+                                       Slice(attributes));
+}
+inline bool verify_ed25519_signature(base::span<const uint8_t> key,
+                                     base::span<const uint8_t> signature,
+                                     base::span<const uint8_t> message) {
+  return ffi::verify_ed25519_signature(Slice(key), Slice(signature),
+                                       Slice(message));
+}
+inline bool verify_ecdsa_p256_signature(base::span<const uint8_t> key,
+                                        base::span<const uint8_t> signature,
+                                        base::span<const uint8_t> message) {
+  return ffi::verify_ecdsa_p256_signature(Slice(key), Slice(signature),
+                                          Slice(message));
+}
+class Sha512Hasher {
+ public:
+  void update(base::span<const uint8_t> chunk) {
+    hasher_->update(Slice(chunk));
+  }
+  std::array<uint8_t, 64> finish() && {
+    auto bytes = ffi::finish_sha512_hasher(std::move(hasher_));
+    CHECK(bytes.size() == 64u);
+    std::array<uint8_t, 64> result;
+    std::ranges::copy(bytes, result.begin());
+    return result;
+  }
+
+ private:
+  ::rust::Box<ffi::Sha512Hasher> hasher_ = ffi::new_sha512_hasher();
+};
+}  // namespace web_package::signed_web_bundles::rust
+#endif
