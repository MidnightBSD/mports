--- cargo-crates/ring-0.17.14/src/cpu/arm.rs.orig	1973-11-29 21:33:09 UTC
+++ cargo-crates/ring-0.17.14/src/cpu/arm.rs
@@ -50,7 +50,7 @@ cfg_if::cfg_if! {
         mod fuchsia;
         use fuchsia as detect;
-    } else if #[cfg(any(target_os = "android", target_os = "linux"))] {
+    } else if #[cfg(any(target_os = "android", target_os = "freebsd", target_os = "linux"))] {
         mod linux;
         use linux as detect;
     } else if #[cfg(all(all(target_arch = "aarch64", target_endian = "little"), target_os = "windows"))] {
