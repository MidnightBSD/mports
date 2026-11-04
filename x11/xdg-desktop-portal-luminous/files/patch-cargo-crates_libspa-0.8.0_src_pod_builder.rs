--- cargo-crates/libspa-0.8.0/src/pod/builder.rs.orig
+++ cargo-crates/libspa-0.8.0/src/pod/builder.rs
@@ -38,9 +38,8 @@ impl<'d> Builder<'d> {
-        (*this).builder.data = (*this).data.as_mut_ptr().cast::<c_void>();
-        (*this).builder.size = (*this)
-            .data
-            .len()
-            .try_into()
-            .expect("data length does not fit in a u32");
+        spa_sys::spa_pod_builder_init(
+            &mut (*this).builder,
+            (*this).data.as_mut_ptr().cast::<c_void>(),
+            (*this).data.len() as u32,
+        );
