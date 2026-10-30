--- components/web_package/rust/bridge.h.orig	2026-10-29 03:26:48 UTC
+++ components/web_package/rust/bridge.h
@@ -0,0 +1,117 @@
+// BSD-style license; see LICENSE.
+#ifndef COMPONENTS_WEB_PACKAGE_RUST_BRIDGE_H_
+#define COMPONENTS_WEB_PACKAGE_RUST_BRIDGE_H_
+#include <string>
+#include <vector>
+
+#include "base/containers/span.h"
+#include "base/types/expected.h"
+#include "components/web_package/rust/bridge.rs.h"
+namespace web_package::rust {
+inline constexpr size_t TRAILING_LENGTH_NUM_BYTES = 8;
+inline constexpr uint64_t INITIAL_BUNDLE_HEADER_BUFFER_SIZE = 24;
+inline constexpr uint64_t MAX_METADATA_SECTION_SIZE = 1024 * 1024;
+inline constexpr uint64_t INITIAL_BUFFER_SIZE_FOR_RESPONSE = 4096;
+inline constexpr std::string_view INDEX_SECTION = "index";
+inline constexpr std::string_view CRITICAL_SECTION = "critical";
+inline constexpr std::string_view PRIMARY_SECTION = "primary";
+struct ParseError {
+  bool is_version_error;
+  std::string message;
+};
+struct SectionOffsetEntry {
+  std::string name;
+  uint64_t offset;
+  uint64_t length;
+};
+struct ParsedIndexEntry {
+  std::string url;
+  uint64_t offset;
+  uint64_t length;
+};
+struct HeaderEntry {
+  std::vector<uint8_t> name;
+  std::vector<uint8_t> value;
+};
+struct ParseResult {
+  uint64_t section_lengths_len, next_read_offset, next_read_length;
+  std::vector<SectionOffsetEntry> metadata_sections;
+  uint64_t responses_offset, responses_length;
+  bool needs_more_data;
+  uint64_t required_buffer_size;
+  int32_t response_code;
+  std::vector<HeaderEntry> headers;
+  uint64_t payload_offset, payload_length;
+};
+inline ::rust::Slice<const uint8_t> Slice(base::span<const uint8_t> data) {
+  return {data.data(), data.size()};
+}
+template <class T, class F>
+inline base::expected<T, ParseError> Convert(ffi::ParseResult result,
+                                             F convert) {
+  if (!result.ok) {
+    return base::unexpected(
+        ParseError{result.is_version_error, std::string(result.error_message)});
+  }
+  return convert(std::move(result));
+}
+inline ParseResult ParseFields(ffi::ParseResult result) {
+  ParseResult out{result.section_lengths_len, result.next_read_offset,
+                  result.next_read_length,    {},
+                  result.responses_offset,    result.responses_length,
+                  result.needs_more_data,     result.required_buffer_size,
+                  result.response_code,       {},
+                  result.payload_offset,      result.payload_length};
+  for (auto& v : result.metadata_sections) {
+    out.metadata_sections.push_back({std::string(v.name), v.offset, v.length});
+  }
+  for (auto& v : result.headers) {
+    out.headers.push_back(
+        {{v.name.begin(), v.name.end()}, {v.value.begin(), v.value.end()}});
+  }
+  return out;
+}
+inline auto parse_trailing_length(base::span<const uint8_t> data,
+                                  uint64_t length) {
+  return Convert<uint64_t>(ffi::parse_trailing_length(Slice(data), length),
+                           [](auto r) { return r.value; });
+}
+inline auto parse_magic_and_version(base::span<const uint8_t> data,
+                                    uint64_t offset) {
+  return Convert<ParseResult>(ffi::parse_magic_and_version(Slice(data), offset),
+                              ParseFields);
+}
+inline auto parse_bundle_header(base::span<const uint8_t> data,
+                                uint64_t length,
+                                uint64_t offset) {
+  return Convert<ParseResult>(
+      ffi::parse_bundle_header(Slice(data), length, offset), ParseFields);
+}
+inline auto parse_index_section(base::span<const uint8_t> data,
+                                uint64_t offset,
+                                uint64_t length) {
+  return Convert<std::vector<ParsedIndexEntry>>(
+      ffi::parse_index_section(Slice(data), offset, length), [](auto r) {
+        std::vector<ParsedIndexEntry> out;
+        for (auto& v : r.index) {
+          out.push_back({std::string(v.url), v.offset, v.length});
+        }
+        return out;
+      });
+}
+inline auto parse_critical_section(base::span<const uint8_t> data) {
+  return Convert<bool>(ffi::parse_critical_section(Slice(data)),
+                       [](auto) { return true; });
+}
+inline auto parse_primary_section(base::span<const uint8_t> data) {
+  return Convert<std::string>(ffi::parse_primary_section(Slice(data)),
+                              [](auto r) { return std::string(r.text); });
+}
+inline auto parse_response(base::span<const uint8_t> data,
+                           uint64_t offset,
+                           uint64_t length) {
+  return Convert<ParseResult>(ffi::parse_response(Slice(data), offset, length),
+                              ParseFields);
+}
+}  // namespace web_package::rust
+#endif
