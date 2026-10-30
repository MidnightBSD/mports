--- components/web_package/signed_web_bundles/rust/lib.rs.orig	2026-10-26 21:13:13 UTC
+++ components/web_package/signed_web_bundles/rust/lib.rs
@@ -3,7 +3,7 @@
 // found in the LICENSE file.
 
 #![no_std]
-#![forbid(unsafe_code)]
+#![deny(unsafe_code)]
 
 extern crate alloc;
 
@@ -23,3 +23,7 @@
     verify_ed25519_signature, verify_signature, Sha512Hasher,
 };
 pub use types::{IntegrityBlock, ParseError, SignatureStackEntry, SignatureType};
+
+// Only cxx generated FFI code needs unsafe declarations.
+#[allow(unsafe_code)]
+mod bridge;
