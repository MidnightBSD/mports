--- third_party/blink/renderer/platform/fonts/ift/ift_patcher.rs.orig	2026-10-26 21:13:13 UTC
+++ third_party/blink/renderer/platform/fonts/ift/ift_patcher.rs
@@ -12,22 +12,7 @@
 use read_fonts::{FontRef, TableProvider};
 use std::collections::{HashMap, HashSet};
 
-/// Status code returned when applying patches to an Incremental Font
-/// Transfer (IFT) patcher.
-#[derive(Copy, Clone, Debug, PartialEq, Eq)]
-#[repr(C)]
-pub enum IftApplyStatus {
-    /// All available patches were applied successfully.
-    Success,
-    /// The font data could not be parsed as a valid OpenType font.
-    InvalidFont,
-    /// Selecting the next patch group failed.
-    PatchGroupError,
-    /// Applying the patch payload failed.
-    PatchError,
-    /// Required patch data has not been provided.
-    MissingPatches,
-}
+use ffi::IftApplyStatus;
 
 #[derive(Clone, Default)]
 pub struct IftSubsetDefinition(SubsetDefinition);
@@ -147,3 +132,58 @@
         self.requested.iter().any(|url| !self.patch_data.contains_key(url))
     }
 }
+
+fn new_subset() -> Box<IftSubsetDefinition> {
+    Box::new(IftSubsetDefinition::default())
+}
+
+fn clone_subset(subset: &IftSubsetDefinition) -> Box<IftSubsetDefinition> {
+    Box::new(subset.clone())
+}
+
+fn union_subset(subset: &mut IftSubsetDefinition, other: &IftSubsetDefinition) {
+    subset.union(other);
+}
+
+fn new_patcher(font_data: &[u8]) -> Box<IftPatcher> {
+    Box::new(IftPatcher::from(font_data))
+}
+
+fn is_ift(font_data: &[u8]) -> bool {
+    IftPatcher::is_ift(font_data)
+}
+
+#[cxx::bridge(namespace = "ift_patcher_rs")]
+mod ffi {
+    enum IftApplyStatus {
+        Success,
+        InvalidFont,
+        PatchGroupError,
+        PatchError,
+        MissingPatches,
+    }
+
+    extern "Rust" {
+        type IftSubsetDefinition;
+        fn new_subset() -> Box<IftSubsetDefinition>;
+        fn clone_subset(subset: &IftSubsetDefinition) -> Box<IftSubsetDefinition>;
+        fn union_subset(subset: &mut IftSubsetDefinition, other: &IftSubsetDefinition);
+        fn add_codepoint(self: &mut IftSubsetDefinition, codepoint: u32) -> bool;
+        fn add_feature_tag(self: &mut IftSubsetDefinition, tag: u32) -> bool;
+        fn add_design_space(
+            self: &mut IftSubsetDefinition,
+            tag: u32,
+            min_val: f64,
+            max_val: f64,
+        ) -> bool;
+
+        type IftPatcher;
+        fn new_patcher(font_data: &[u8]) -> Box<IftPatcher>;
+        fn is_ift(font_data: &[u8]) -> bool;
+        fn font_data(self: &IftPatcher) -> &[u8];
+        fn request_patches(self: &mut IftPatcher, subset: &IftSubsetDefinition) -> Vec<String>;
+        fn add_patch_data(self: &mut IftPatcher, patch: &str, data: &[u8]);
+        fn apply_patches(self: &mut IftPatcher, subset: &IftSubsetDefinition) -> IftApplyStatus;
+        fn has_pending_patch_requests(self: &IftPatcher) -> bool;
+    }
+}
