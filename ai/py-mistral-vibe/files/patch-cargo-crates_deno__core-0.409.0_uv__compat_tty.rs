--- cargo-crates/deno_core-0.409.0/uv_compat/tty.rs.orig	2026-07-01 13:28:43 UTC
+++ cargo-crates/deno_core-0.409.0/uv_compat/tty.rs
@@ -382,7 +382,7 @@ mod global_termios {
   }
 
   /// Get a pointer to the thread-local errno value.
-  #[cfg(target_os = "macos")]
+  #[cfg(any(target_os = "macos", target_os = "freebsd"))]
   fn errno_location() -> *mut c_int {
     unsafe extern "C" {
       fn __error() -> *mut c_int;
@@ -398,7 +398,7 @@ mod global_termios {
     unsafe { __errno_location() }
   }
 
-  #[cfg(not(any(target_os = "macos", target_os = "linux")))]
+  #[cfg(not(any(target_os = "macos", target_os = "linux", target_os = "freebsd")))]
   fn errno_location() -> *mut c_int {
     compile_error!(
       "errno_location not implemented for this platform — \
