--- components/web_package/signed_web_bundles/rust/bridge.rs.orig	2026-10-29 03:26:48 UTC
+++ components/web_package/signed_web_bundles/rust/bridge.rs
@@ -0,0 +1,79 @@
+// BSD-style license; see LICENSE.
+// Copy borrowed parser outputs into owned FFI values, retaining upstream validation.
+use crate::Sha512Hasher;
+use alloc::{boxed::Box, string::String, vec::Vec};
+#[cxx::bridge(namespace = "web_package::signed_web_bundles::rust::ffi")]
+pub mod ffi {
+    #[derive(Default)]
+    struct SignatureStackEntry {
+        attributes_cbor: Vec<u8>,
+        signature_type: u8,
+        public_key: Vec<u8>,
+        signature: Vec<u8>,
+    }
+    #[derive(Default)]
+    struct IntegrityBlock {
+        ok: bool,
+        is_version_error: bool,
+        error_message: String,
+        size: usize,
+        web_bundle_id: String,
+        attributes_cbor: Vec<u8>,
+        signature_stack: Vec<SignatureStackEntry>,
+    }
+    extern "Rust" {
+        type Sha512Hasher;
+        fn parse_integrity_block(data: &[u8]) -> IntegrityBlock;
+        fn create_empty_integrity_block_cbor(attributes: &[u8]) -> Vec<u8>;
+        fn create_signature_payload(hash: &[u8], block: &[u8], attributes: &[u8]) -> Vec<u8>;
+        fn verify_ed25519_signature(key: &[u8], signature: &[u8], message: &[u8]) -> bool;
+        fn verify_ecdsa_p256_signature(key: &[u8], signature: &[u8], message: &[u8]) -> bool;
+        fn new_sha512_hasher() -> Box<Sha512Hasher>;
+        fn update(self: &mut Sha512Hasher, chunk: &[u8]);
+        fn finish_sha512_hasher(hasher: Box<Sha512Hasher>) -> Vec<u8>;
+    }
+}
+fn parse_integrity_block(data: &[u8]) -> ffi::IntegrityBlock {
+    let mut out = ffi::IntegrityBlock::default();
+    match crate::parse_integrity_block(data) {
+        Ok(value) => {
+            out.ok = true;
+            out.size = value.size;
+            out.web_bundle_id = String::from(value.web_bundle_id);
+            out.attributes_cbor = value.attributes_cbor;
+            out.signature_stack = value
+                .signature_stack
+                .into_iter()
+                .map(|v| ffi::SignatureStackEntry {
+                    attributes_cbor: v.attributes_cbor,
+                    signature_type: v.signature_type as u8,
+                    public_key: v.public_key.to_vec(),
+                    signature: v.signature.to_vec(),
+                })
+                .collect();
+        }
+        Err(error) => {
+            out.is_version_error = error.is_version_error;
+            out.error_message = error.message;
+        }
+    }
+    out
+}
+fn create_empty_integrity_block_cbor(attributes: &[u8]) -> Vec<u8> {
+    crate::create_empty_integrity_block_cbor(attributes)
+}
+fn create_signature_payload(hash: &[u8], block: &[u8], attributes: &[u8]) -> Vec<u8> {
+    crate::create_signature_payload(hash, block, attributes)
+}
+fn verify_ed25519_signature(key: &[u8], signature: &[u8], message: &[u8]) -> bool {
+    crate::verify_ed25519_signature(key, signature, message)
+}
+fn verify_ecdsa_p256_signature(key: &[u8], signature: &[u8], message: &[u8]) -> bool {
+    crate::verify_ecdsa_p256_signature(key, signature, message)
+}
+fn new_sha512_hasher() -> Box<Sha512Hasher> {
+    Box::new(Sha512Hasher::new())
+}
+fn finish_sha512_hasher(hasher: Box<Sha512Hasher>) -> Vec<u8> {
+    (*hasher).finish().to_vec()
+}
