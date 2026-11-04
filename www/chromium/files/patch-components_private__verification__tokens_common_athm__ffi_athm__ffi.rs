--- components/private_verification_tokens/common/athm_ffi/athm_ffi.rs.orig	2026-10-26 21:13:13 UTC
+++ components/private_verification_tokens/common/athm_ffi/athm_ffi.rs
@@ -2,7 +2,7 @@
 // Use of this source code is governed by a BSD-style license that can be
 // found in the LICENSE file.
 
-//! Crubit FFI over the Anonymous Tokens with Hidden Metadata (ATHM) crate
+//! CXX FFI over the Anonymous Tokens with Hidden Metadata (ATHM) crate
 //! (`//third_party/anonymous_tokens:athm`), exposing the issuer- and
 //! client-side protocol operations to C++. The elliptic-curve and hashing
 //! primitives run on Chromium's in-tree `BoringSSL` via the `bssl_sys`
@@ -35,3 +35,5 @@
 pub use privacy_pass_client::*;
 pub use privacy_pass_common::*;
 pub use privacy_pass_issuer::*;
+
+mod cxx_bridge;
