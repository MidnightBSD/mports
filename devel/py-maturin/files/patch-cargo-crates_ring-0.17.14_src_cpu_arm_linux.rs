--- cargo-crates/ring-0.17.14/src/cpu/arm/linux.rs.orig	1973-11-29 21:33:09 UTC
+++ cargo-crates/ring-0.17.14/src/cpu/arm/linux.rs
@@ -46,2 +46,28 @@ pub fn detect_features() -> u32 {
     use super::{Aes, PMull, Sha256, Sha512, CAPS_STATIC};
-    use libc::{getauxval, AT_HWCAP, HWCAP_AES, HWCAP_PMULL, HWCAP_SHA2, HWCAP_SHA512};
+    #[cfg(target_os = "freebsd")]
+    use libc::{c_int, c_ulong, c_void};
+    #[cfg(not(target_os = "freebsd"))]
+    use libc::{getauxval, AT_HWCAP, HWCAP_AES, HWCAP_PMULL, HWCAP_SHA2, HWCAP_SHA512};
+    #[cfg(target_os = "freebsd")]
+    extern crate std;
+    #[cfg(target_os = "freebsd")]
+    extern "C" {
+        fn elf_aux_info(aux: c_int, buf: *mut c_void, buflen: c_int) -> c_int;
+    }
+    #[cfg(target_os = "freebsd")]
+    const AT_HWCAP: c_int = 25;
+    #[cfg(target_os = "freebsd")]
+    const HWCAP_AES: c_ulong = 1 << 3;
+    #[cfg(target_os = "freebsd")]
+    const HWCAP_PMULL: c_ulong = 1 << 4;
+    #[cfg(target_os = "freebsd")]
+    const HWCAP_SHA2: c_ulong = 1 << 6;
+    #[cfg(target_os = "freebsd")]
+    const HWCAP_SHA512: c_ulong = 1 << 21;
+    #[cfg(target_os = "freebsd")]
+    fn getauxval(aux: c_int) -> c_ulong {
+        let mut caps: c_ulong = 0;
+        let buffer = (&raw mut caps).cast::<c_void>();
+        let _ = unsafe { elf_aux_info(aux, buffer, std::mem::size_of_val(&caps) as c_int) };
+        caps
+    }
@@ -84,6 +110,18 @@ pub fn detect_features() -> u32 {
     use libc::c_ulong;
+    #[cfg(not(target_os = "freebsd"))]
     extern "C" {
         pub fn getauxval(type_: c_ulong) -> c_ulong;
     }
-    const AT_HWCAP: c_ulong = 16;
+    #[cfg(target_os = "freebsd")]
+    use libc::{c_int, c_void};
+    #[cfg(target_os = "freebsd")]
+    extern crate std;
+    #[cfg(target_os = "freebsd")]
+    extern "C" {
+        fn elf_aux_info(aux: c_int, buf: *mut c_void, buflen: c_int) -> c_int;
+    }
+    #[cfg(not(target_os = "freebsd"))]
+    const AT_HWCAP: c_ulong = 16;
+    #[cfg(target_os = "freebsd")]
+    const AT_HWCAP: c_int = 25;
     const HWCAP_NEON: c_ulong = 1 << 12;
@@ -96,2 +134,12 @@ pub fn detect_features() -> u32 {
     if CAPS_STATIC & Neon::mask() != Neon::mask() {
+        #[cfg(not(target_os = "freebsd"))]
         let caps = unsafe { getauxval(AT_HWCAP) };
+        #[cfg(target_os = "freebsd")]
+        let caps = {
+            let mut caps: c_ulong = 0;
+            let buffer = (&raw mut caps).cast::<c_void>();
+            let _ = unsafe {
+                elf_aux_info(AT_HWCAP, buffer, std::mem::size_of_val(&caps) as c_int)
+            };
+            caps
+        };
