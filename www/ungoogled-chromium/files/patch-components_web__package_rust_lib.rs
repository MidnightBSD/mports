--- components/web_package/rust/lib.rs.orig	2026-10-26 21:13:13 UTC
+++ components/web_package/rust/lib.rs
@@ -3,7 +3,7 @@
 // found in the LICENSE file.
 
 #![no_std]
-#![forbid(unsafe_code)]
+#![deny(unsafe_code)]
 
 extern crate alloc;
 
@@ -25,3 +25,7 @@
     BundleHeaderResult, HeaderEntry, MagicAndVersionResult, ParseError, ParsedIndexEntry,
     ResponseParseResult, SectionOffsetEntry,
 };
+
+// Only cxx generated FFI code needs unsafe declarations.
+#[allow(unsafe_code)]
+mod bridge;
