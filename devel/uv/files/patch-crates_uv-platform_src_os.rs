--- crates/uv-platform/src/os.rs.orig	2026-05-21 21:21:08 UTC
+++ crates/uv-platform/src/os.rs
@@ -81,3 +81,4 @@
             }
-            uv_platform_tags::Os::FreeBsd { .. } => {
+            uv_platform_tags::Os::FreeBsd { .. }
+            | uv_platform_tags::Os::MidnightBsd { .. } => {
                 Self::new(target_lexicon::OperatingSystem::Freebsd)
