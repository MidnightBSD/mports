--- third_party/blink/renderer/platform/fonts/ift/ift_patcher.cc.orig	2026-10-26 21:13:13 UTC
+++ third_party/blink/renderer/platform/fonts/ift/ift_patcher.cc
@@ -7,6 +7,7 @@
 #include <string>
 #include <utility>
 
+#include "base/containers/span_rust.h"
 #include "base/memory/ptr_util.h"
 #include "base/notreached.h"
 #include "base/numerics/safe_conversions.h"
@@ -14,7 +15,8 @@
 
 namespace blink {
 
-IftSubsetDefinition::IftSubsetDefinition() = default;
+IftSubsetDefinition::IftSubsetDefinition()
+    : subset_(ift_patcher_rs::new_subset()) {}
 
 IftSubsetDefinition::~IftSubsetDefinition() = default;
 
@@ -23,34 +25,40 @@
 IftSubsetDefinition& IftSubsetDefinition::operator=(IftSubsetDefinition&&) =
     default;
 
-IftSubsetDefinition::IftSubsetDefinition(const IftSubsetDefinition&) = default;
+IftSubsetDefinition::IftSubsetDefinition(const IftSubsetDefinition& other)
+    : subset_(ift_patcher_rs::clone_subset(*other.subset_)) {}
 
 IftSubsetDefinition& IftSubsetDefinition::operator=(
-    const IftSubsetDefinition&) = default;
+    const IftSubsetDefinition& other) {
+  if (this != &other) {
+    subset_ = ift_patcher_rs::clone_subset(*other.subset_);
+  }
+  return *this;
+}
 
 IftSubsetDefinition::IftSubsetDefinition(
-    ift_patcher_rs::IftSubsetDefinition subset)
+    rust::Box<ift_patcher_rs::IftSubsetDefinition> subset)
     : subset_(std::move(subset)) {}
 
 bool IftSubsetDefinition::AddCodepoint(uint32_t codepoint) {
-  return subset_.add_codepoint(codepoint);
+  return subset_->add_codepoint(codepoint);
 }
 
 bool IftSubsetDefinition::AddFeatureTag(uint32_t tag) {
-  return subset_.add_feature_tag(tag);
+  return subset_->add_feature_tag(tag);
 }
 
 bool IftSubsetDefinition::AddDesignSpace(uint32_t tag,
                                          double min_value,
                                          double max_value) {
-  return subset_.add_design_space(tag, min_value, max_value);
+  return subset_->add_design_space(tag, min_value, max_value);
 }
 
 void IftSubsetDefinition::Union(const IftSubsetDefinition& other) {
-  subset_.union_(other.subset_);
+  ift_patcher_rs::union_subset(*subset_, *other.subset_);
 }
 
-IftPatcher::IftPatcher(ift_patcher_rs::IftPatcher patcher)
+IftPatcher::IftPatcher(rust::Box<ift_patcher_rs::IftPatcher> patcher)
     : patcher_(std::move(patcher)) {}
 
 IftPatcher::~IftPatcher() = default;
@@ -64,55 +72,54 @@
   if (!RuntimeEnabledFeatures::IncrementalFontTransferEnabled()) {
     return nullptr;
   }
-  if (!ift_patcher_rs::IftPatcher::is_ift(font_data)) {
+  if (!ift_patcher_rs::is_ift(base::SpanToRustSlice(font_data))) {
     return nullptr;
   }
-  return base::WrapUnique(
-      new IftPatcher(ift_patcher_rs::IftPatcher(font_data)));
+  return base::WrapUnique(new IftPatcher(
+      ift_patcher_rs::new_patcher(base::SpanToRustSlice(font_data))));
 }
 
 base::span<const uint8_t> IftPatcher::GetFontData() const {
-  rs_std::SliceRef<const ::std::uint8_t> font_data = patcher_.font_data();
-  return base::span(font_data.to_span());
+  rust::Slice<const uint8_t> font_data = patcher_->font_data();
+  return base::span(font_data.data(), font_data.size());
 }
 
 Vector<String> IftPatcher::RequestPatches(const IftSubsetDefinition& subset) {
-  rs_std::Vec<::rs::alloc::string::String> urls =
-      patcher_.request_patches(subset.subset_);
+  rust::Vec<rust::String> urls = patcher_->request_patches(*subset.subset_);
   Vector<String> ret;
   ret.ReserveInitialCapacity(base::checked_cast<wtf_size_t>(urls.size()));
-  for (const ::rs::alloc::string::String& url : urls) {
-    ret.push_back(String::FromUtf8(url.as_str()));
+  for (const rust::String& url : urls) {
+    ret.push_back(String::FromUtf8(std::string(url)));
   }
   return ret;
 }
 
 void IftPatcher::AddPatchData(const String& url,
                               base::span<const uint8_t> data) {
-  std::string utf8_url = url.Utf8();
-  patcher_.add_patch_data(rs_std::StrRef::FromUtf8Unchecked(utf8_url), data);
+  std::string utf8_url = url.Utf8(Utf8ConversionMode::kStrictReplacingErrors);
+  patcher_->add_patch_data(rust::Str(utf8_url), base::SpanToRustSlice(data));
 }
 
 IftPatcher::ApplyStatus IftPatcher::ApplyPatches(
     const IftSubsetDefinition& subset) {
   ift_patcher_rs::IftApplyStatus status =
-      patcher_.apply_patches(subset.subset_);
-  switch (status.tag) {
-    case ift_patcher_rs::IftApplyStatus::Tag::Success:
+      patcher_->apply_patches(*subset.subset_);
+  switch (status) {
+    case ift_patcher_rs::IftApplyStatus::Success:
       return ApplyStatus::kSuccess;
-    case ift_patcher_rs::IftApplyStatus::Tag::InvalidFont:
+    case ift_patcher_rs::IftApplyStatus::InvalidFont:
       return ApplyStatus::kInvalidFont;
-    case ift_patcher_rs::IftApplyStatus::Tag::PatchGroupError:
+    case ift_patcher_rs::IftApplyStatus::PatchGroupError:
       return ApplyStatus::kPatchGroupError;
-    case ift_patcher_rs::IftApplyStatus::Tag::PatchError:
+    case ift_patcher_rs::IftApplyStatus::PatchError:
       return ApplyStatus::kPatchError;
-    case ift_patcher_rs::IftApplyStatus::Tag::MissingPatches:
+    case ift_patcher_rs::IftApplyStatus::MissingPatches:
       return ApplyStatus::kMissingPatches;
   }
 }
 
 bool IftPatcher::HasPendingPatchRequests() const {
-  return patcher_.has_pending_patch_requests();
+  return patcher_->has_pending_patch_requests();
 }
 
 }  // namespace blink
