--- src/target.rs.orig	2024-03-21 12:30:28 UTC
+++ src/target.rs
@@ -1,4 +1,3 @@
-use crate::cross_compile::is_cross_compiling;
 use crate::PlatformTag;
 use anyhow::{anyhow, bail, format_err, Result};
 use platform_info::*;
@@ -30,6 +29,7 @@ pub enum Os {
     Haiku,
     Emscripten,
     Wasi,
+    MidnightBsd,
 }
 
 impl fmt::Display for Os {
@@ -39,6 +39,7 @@ impl fmt::Display for Os {
             Os::Windows => write!(f, "Windows"),
             Os::Macos => write!(f, "macOS"),
             Os::FreeBsd => write!(f, "FreeBSD"),
+            Os::MidnightBsd => write!(f, "MidnightBSD"),
             Os::NetBsd => write!(f, "NetBSD"),
             Os::OpenBsd => write!(f, "OpenBSD"),
             Os::Dragonfly => write!(f, "DragonFly"),
@@ -152,7 +153,7 @@ fn get_supported_architectures(os: &Os) -> Vec<Arch> {
         ],
         Os::Windows => vec![Arch::X86, Arch::X86_64, Arch::Aarch64],
         Os::Macos => vec![Arch::Aarch64, Arch::X86_64],
-        Os::FreeBsd | Os::NetBsd => vec![
+        Os::FreeBsd | Os::MidnightBsd | Os::NetBsd => vec![
             Arch::Aarch64,
             Arch::Armv6L,
             Arch::Armv7L,
@@ -290,15 +291,12 @@ impl Target {
             user_specified: target_triple.is_some(),
             cross_compiling: false,
         };
-        target.cross_compiling = is_cross_compiling(&target)?;
+        target.cross_compiling = false; //is_cross_compiling(&target)?;
         Ok(target)
     }
 
     /// Returns the platform architecture
     pub fn get_platform_arch(&self) -> Result<String> {
-        if self.cross_compiling {
-            return Ok(self.arch.to_string());
-        }
         let machine = PlatformInfo::new().map(|info| info.machine().to_string_lossy().into_owned());
         let arch = match machine {
             Ok(machine) => {
@@ -375,6 +373,7 @@ impl Target {
             Os::Emscripten => "emscripten",
             // This isn't real, there's no sys.platform here
             Os::Wasi => "wasi",
+            Os::MidnightBsd => "midnightbsd",
         }
     }
 
@@ -450,6 +449,7 @@ impl Target {
             Os::Linux
             | Os::Macos
             | Os::FreeBsd
+            | Os::MidnightBsd
             | Os::NetBsd
             | Os::OpenBsd
             | Os::Dragonfly
@@ -548,7 +548,7 @@ impl Target {
     /// Is cross compiling for this target
     #[inline]
     pub fn cross_compiling(&self) -> bool {
-        self.cross_compiling
+        false
     }
 
     /// Returns the path to the python executable inside a venv
