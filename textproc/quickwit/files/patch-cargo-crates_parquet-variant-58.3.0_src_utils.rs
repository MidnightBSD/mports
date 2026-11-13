--- cargo-crates/parquet-variant-58.3.0/src/utils.rs.orig
+++ cargo-crates/parquet-variant-58.3.0/src/utils.rs
@@ -142,7 +142,9 @@
 #[allow(unused)]
 pub(crate) const fn expect_size_of<T>(expected: usize) {
     let size = std::mem::size_of::<T>();
-    if size != expected {
+    // The expected sizes assume 64-bit pointers; skip the check on
+    // 32-bit targets such as i386.
+    if cfg!(target_pointer_width = "64") && size != expected {
         let _ = [""; 0][size];
     }
 }
