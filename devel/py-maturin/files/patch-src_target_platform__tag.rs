--- src/target/platform_tag.rs.orig
+++ src/target/platform_tag.rs
@@ -133,7 +133,7 @@
         (Os::FreeBsd, _) => {
             format!(
                 "{}_{}_{}",
-                target.target_os().to_string().to_ascii_lowercase(),
+                target.get_python_os(),
                 target.get_platform_release()?.to_ascii_lowercase(),
                 target.target_arch().machine(),
             )
