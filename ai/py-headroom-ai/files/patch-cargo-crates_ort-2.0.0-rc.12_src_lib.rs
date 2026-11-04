--- cargo-crates/ort-2.0.0-rc.12/src/lib.rs.orig	2026-06-02 21:42:00 UTC
+++ cargo-crates/ort-2.0.0-rc.12/src/lib.rs
@@ -191 +191 @@ fn setup_api() -> ApiPointer {
-				#[cfg(any(target_os = "linux", target_os = "android"))]
+				#[cfg(any(target_os = "linux", target_os = "android", target_os = "freebsd"))]
