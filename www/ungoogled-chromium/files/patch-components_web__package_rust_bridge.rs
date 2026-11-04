--- components/web_package/rust/bridge.rs.orig	2026-10-29 03:26:48 UTC
+++ components/web_package/rust/bridge.rs
@@ -0,0 +1,123 @@
+// BSD-style license; see LICENSE.
+// Owned FFI results keep all validation in the upstream Rust parser.
+use alloc::string::String;
+#[cxx::bridge(namespace = "web_package::rust::ffi")]
+pub mod ffi {
+    #[derive(Default)]
+    struct SectionOffsetEntry {
+        name: String,
+        offset: u64,
+        length: u64,
+    }
+    #[derive(Default)]
+    struct ParsedIndexEntry {
+        url: String,
+        offset: u64,
+        length: u64,
+    }
+    #[derive(Default)]
+    struct HeaderEntry {
+        name: Vec<u8>,
+        value: Vec<u8>,
+    }
+    #[derive(Default)]
+    struct ParseResult {
+        ok: bool,
+        is_version_error: bool,
+        error_message: String,
+        value: u64,
+        text: String,
+        section_lengths_len: u64,
+        next_read_offset: u64,
+        next_read_length: u64,
+        metadata_sections: Vec<SectionOffsetEntry>,
+        responses_offset: u64,
+        responses_length: u64,
+        index: Vec<ParsedIndexEntry>,
+        needs_more_data: bool,
+        required_buffer_size: u64,
+        response_code: i32,
+        headers: Vec<HeaderEntry>,
+        payload_offset: u64,
+        payload_length: u64,
+    }
+    extern "Rust" {
+        fn parse_trailing_length(data: &[u8], file_length: u64) -> ParseResult;
+        fn parse_magic_and_version(data: &[u8], offset: u64) -> ParseResult;
+        fn parse_bundle_header(data: &[u8], length: u64, offset: u64) -> ParseResult;
+        fn parse_index_section(data: &[u8], offset: u64, length: u64) -> ParseResult;
+        fn parse_critical_section(data: &[u8]) -> ParseResult;
+        fn parse_primary_section(data: &[u8]) -> ParseResult;
+        fn parse_response(data: &[u8], offset: u64, length: u64) -> ParseResult;
+    }
+}
+fn convert<T>(
+    result: Result<T, crate::ParseError>,
+    assign: impl FnOnce(&mut ffi::ParseResult, T),
+) -> ffi::ParseResult {
+    let mut out = ffi::ParseResult::default();
+    match result {
+        Ok(value) => {
+            out.ok = true;
+            assign(&mut out, value);
+        }
+        Err(error) => {
+            out.is_version_error = error.is_version_error;
+            out.error_message = String::from(error.message);
+        }
+    }
+    out
+}
+fn parse_trailing_length(data: &[u8], file_length: u64) -> ffi::ParseResult {
+    convert(crate::parse_trailing_length(data, file_length), |o, v| o.value = v)
+}
+fn parse_magic_and_version(data: &[u8], offset: u64) -> ffi::ParseResult {
+    convert(crate::parse_magic_and_version(data, offset), |o, v| {
+        o.section_lengths_len = v.section_lengths_len;
+        o.next_read_offset = v.next_read_offset;
+        o.next_read_length = v.next_read_length;
+    })
+}
+fn parse_bundle_header(data: &[u8], length: u64, offset: u64) -> ffi::ParseResult {
+    convert(crate::parse_bundle_header(data, length, offset), |o, v| {
+        o.responses_offset = v.responses_offset;
+        o.responses_length = v.responses_length;
+        o.metadata_sections = v
+            .metadata_sections
+            .into_iter()
+            .map(|v| ffi::SectionOffsetEntry { name: v.name, offset: v.offset, length: v.length })
+            .collect();
+    })
+}
+fn parse_index_section(data: &[u8], offset: u64, length: u64) -> ffi::ParseResult {
+    convert(crate::parse_index_section(data, offset, length), |o, v| {
+        o.index = v
+            .into_iter()
+            .map(|v| ffi::ParsedIndexEntry {
+                url: String::from(v.url),
+                offset: v.offset,
+                length: v.length,
+            })
+            .collect()
+    })
+}
+fn parse_critical_section(data: &[u8]) -> ffi::ParseResult {
+    convert(crate::parse_critical_section(data), |_, _| {})
+}
+fn parse_primary_section(data: &[u8]) -> ffi::ParseResult {
+    convert(crate::parse_primary_section(data), |o, v| o.text = String::from(v))
+}
+fn parse_response(data: &[u8], offset: u64, length: u64) -> ffi::ParseResult {
+    convert(crate::parse_response(data, offset, length), |o, v| {
+        o.needs_more_data = v.needs_more_data;
+        o.required_buffer_size = v.required_buffer_size;
+        o.response_code = v.response_code;
+        o.payload_offset = v.payload_offset;
+        o.payload_length = v.payload_length;
+        o.headers = v
+            .headers
+            .into_iter()
+            .map(|v| ffi::HeaderEntry { name: v.name.to_vec(), value: v.value.to_vec() })
+            .collect();
+    })
+}
