--- components/private_verification_tokens/common/athm_ffi/cxx_bridge.rs.orig	2026-10-29 03:26:48 UTC
+++ components/private_verification_tokens/common/athm_ffi/cxx_bridge.rs
@@ -0,0 +1,134 @@
+// Copyright 2026 The Chromium Authors
+// Use of this source code is governed by a BSD-style license that can be
+// found in the LICENSE file.
+
+use crate::{AthmStatus, PrivacyPassAthmIssuer, PrivacyPassBatchClient};
+
+#[cxx::bridge(namespace = "private_verification_tokens::ffi")]
+mod ffi {
+    struct WireToken {
+        bytes: Vec<u8>,
+    }
+    struct ClientResult {
+        client: Box<ClientHandle>,
+        status: u8,
+    }
+    struct IssuerResult {
+        issuer: Box<IssuerHandle>,
+        status: u8,
+    }
+    struct BytesResult {
+        bytes: Vec<u8>,
+        status: u8,
+    }
+    struct TokensResult {
+        tokens: Vec<WireToken>,
+        status: u8,
+    }
+    struct MetadataResult {
+        metadata: u8,
+        status: u8,
+    }
+
+    extern "Rust" {
+        type ClientHandle;
+        type IssuerHandle;
+        fn client_new(
+            public_key: &[u8],
+            public_key_proof: &[u8],
+            num_buckets: u8,
+            deployment_id: &[u8],
+            version: u32,
+            batch_size: usize,
+        ) -> ClientResult;
+        fn request_body(self: &ClientHandle) -> &[u8];
+        fn finalize(self: &mut ClientHandle, response_body: &[u8]) -> TokensResult;
+        fn issuer_new(num_buckets: u8, deployment_id: &[u8]) -> IssuerResult;
+        fn public_key_bytes(self: &IssuerHandle) -> Vec<u8>;
+        fn public_key_proof_bytes(self: &IssuerHandle) -> Vec<u8>;
+        fn issue_batch_from_bytes(self: &IssuerHandle, request: &[u8], metadata: u8)
+            -> BytesResult;
+        fn verify_wire_token(self: &IssuerHandle, token: &[u8]) -> MetadataResult;
+    }
+}
+
+// Failed constructors carry an empty handle which is discarded by the C++
+// facade. Successful handles own exactly the same protocol objects as Crubit.
+pub struct ClientHandle(Option<PrivacyPassBatchClient>);
+pub struct IssuerHandle(Option<PrivacyPassAthmIssuer>);
+
+fn client_new(
+    public_key: &[u8],
+    public_key_proof: &[u8],
+    num_buckets: u8,
+    deployment_id: &[u8],
+    version: u32,
+    batch_size: usize,
+) -> ffi::ClientResult {
+    match PrivacyPassBatchClient::try_new(
+        public_key,
+        public_key_proof,
+        num_buckets,
+        deployment_id,
+        version,
+        batch_size,
+    ) {
+        Ok(client) => ffi::ClientResult { client: Box::new(ClientHandle(Some(client))), status: 0 },
+        Err(status) => {
+            ffi::ClientResult { client: Box::new(ClientHandle(None)), status: status as u8 }
+        }
+    }
+}
+
+impl ClientHandle {
+    fn request_body(&self) -> &[u8] {
+        self.0.as_ref().expect("only successful handles cross the C++ facade").request_body()
+    }
+    fn finalize(&mut self, response_body: &[u8]) -> ffi::TokensResult {
+        let result = self
+            .0
+            .as_mut()
+            .ok_or(AthmStatus::OperationFailed)
+            .and_then(|client| client.finalize(response_body));
+        match result {
+            Ok(tokens) => ffi::TokensResult {
+                tokens: tokens.into_iter().map(|bytes| ffi::WireToken { bytes }).collect(),
+                status: 0,
+            },
+            Err(status) => ffi::TokensResult { tokens: Vec::new(), status: status as u8 },
+        }
+    }
+}
+
+fn issuer_new(num_buckets: u8, deployment_id: &[u8]) -> ffi::IssuerResult {
+    match PrivacyPassAthmIssuer::try_new(num_buckets, deployment_id) {
+        Ok(issuer) => ffi::IssuerResult { issuer: Box::new(IssuerHandle(Some(issuer))), status: 0 },
+        Err(status) => {
+            ffi::IssuerResult { issuer: Box::new(IssuerHandle(None)), status: status as u8 }
+        }
+    }
+}
+
+impl IssuerHandle {
+    fn issuer(&self) -> &PrivacyPassAthmIssuer {
+        self.0.as_ref().expect("only successful handles cross the C++ facade")
+    }
+    fn public_key_bytes(&self) -> Vec<u8> {
+        self.issuer().public_key_bytes()
+    }
+    fn public_key_proof_bytes(&self) -> Vec<u8> {
+        self.issuer().public_key_proof_bytes()
+    }
+    fn issue_batch_from_bytes(&self, request: &[u8], metadata: u8) -> ffi::BytesResult {
+        match self.issuer().issue_batch_from_bytes(request, metadata) {
+            Ok(bytes) => ffi::BytesResult { bytes, status: 0 },
+            Err(status) => ffi::BytesResult { bytes: Vec::new(), status: status as u8 },
+        }
+    }
+    fn verify_wire_token(&self, token: &[u8]) -> ffi::MetadataResult {
+        match self.issuer().verify_wire_token(token) {
+            Ok(metadata) => ffi::MetadataResult { metadata, status: 0 },
+            Err(status) => ffi::MetadataResult { metadata: 0, status: status as u8 },
+        }
+    }
+}
