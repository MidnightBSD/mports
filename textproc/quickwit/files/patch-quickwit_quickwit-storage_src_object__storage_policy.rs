--- quickwit/quickwit-storage/src/object_storage/policy.rs.orig	2024-03-26 12:28:22 UTC
+++ quickwit/quickwit-storage/src/object_storage/policy.rs
@@ -72,13 +72,16 @@ impl MultiPartPolicy {
 impl Default for MultiPartPolicy {
     fn default() -> Self {
         MultiPartPolicy {
-            // S3 limits part size from 5M to 5GB, we want to end up with as few parts as possible
-            // since each part is charged as a put request.
-            target_part_num_bytes: 5_000_000_000, // 5GB
+            // S3 limits part size from 5M to 5GB. On 32-bit platforms, use the
+            // largest practical default that fits in usize.
+            #[cfg(target_pointer_width = "64")]
+            target_part_num_bytes: 5_000_000_000, // 5GB
+            #[cfg(target_pointer_width = "32")]
+            target_part_num_bytes: 4_000_000_000,
             multipart_threshold_num_bytes: 128 * 1_024 * 1_024, // 128 MiB
             max_num_parts: 10_000,
             max_object_num_bytes: 5_000_000_000_000u64, // S3 allows up to 5TB objects
             max_concurrent_uploads: 100,
         }
     }
