--- cargo-crates/v8-150.3.0/build.rs.orig	2026-10-27 00:00:00 UTC
+++ cargo-crates/v8-150.3.0/build.rs
@@ -289,7 +289,7 @@ fn build_v8(is_asan: bool) {
     download_ninja_gn_binaries();
   }
 
-  download_rust_toolchain();
+  // Use the system Rust toolchain for the BSD source build.
 
   // `#[cfg(...)]` attributes don't work as expected from build.rs -- they refer to the configuration
