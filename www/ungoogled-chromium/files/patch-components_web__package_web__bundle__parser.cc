--- components/web_package/web_bundle_parser.cc.orig	2026-10-26 21:13:13 UTC
+++ components/web_package/web_bundle_parser.cc
@@ -26,7 +26,7 @@
 #include "base/strings/string_util.h"
 #include "base/strings/string_view_util.h"
 #include "components/web_package/mojom/web_bundle_parser.mojom.h"
-#include "components/web_package/rust/web_package_rust.h"
+#include "components/web_package/rust/bridge.h"
 #include "components/web_package/signed_web_bundles/integrity_block_parser.h"
 #include "mojo/public/cpp/bindings/remote.h"
 
@@ -337,7 +337,7 @@
   std::optional<uint64_t> start_reading_offset_;
   ParseMetadataCallback result_callback_;
   ParsingCompleteCallback complete_callback_;
-  rs_std::Vec<rust::SectionOffsetEntry> metadata_sections_to_read_;
+  std::vector<rust::SectionOffsetEntry> metadata_sections_to_read_;
   uint64_t responses_section_offset_ = 0;
   uint64_t responses_section_length_ = 0;
   mojom::BundleMetadataPtr metadata_;
@@ -409,8 +409,8 @@
     response->response_headers = base::MakeFlatMap<std::string, std::string>(
         parse_res->headers, {}, [](const rust::HeaderEntry& header) {
           return std::make_pair(
-              std::string(base::as_string_view(header.name.to_span())),
-              std::string(base::as_string_view(header.value.to_span())));
+              std::string(base::as_string_view(base::span(header.name))),
+              std::string(base::as_string_view(base::span(header.value))));
         });
     response->payload_offset = parse_res->payload_offset;
     response->payload_length = parse_res->payload_length;
