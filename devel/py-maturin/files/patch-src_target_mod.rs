--- src/target/mod.rs.orig	2025-12-03 14:04:39 UTC
+++ src/target/mod.rs
@@ -1,6 +1,5 @@
 use crate::PlatformTag;
 use crate::build_options::TargetTriple;
-use crate::cross_compile::is_cross_compiling;
 use crate::python_interpreter::InterpreterKind;
 use crate::python_interpreter::InterpreterKind::{CPython, GraalPy, PyPy};
 use anyhow::{Result, anyhow, bail, format_err};
@@ -285,5 +284,3 @@ impl Target {
     ) -> Result<Self> {
-        use target_lexicon::{
-            ArmArchitecture, Mips32Architecture, Mips64Architecture, OperatingSystem,
-        };
+        use target_lexicon::{ArmArchitecture, Mips32Architecture, Mips64Architecture};
         let platform = Triple::from_str(target_triple)
@@ -294,22 +291,1 @@ impl Target {
-        let os = match platform.operating_system {
-            OperatingSystem::Linux => match platform.environment {
-                Environment::Android | Environment::Androideabi => Os::Android,
-                _ => Os::Linux,
-            },
-            OperatingSystem::Windows => Os::Windows,
-            OperatingSystem::MacOSX(_) | OperatingSystem::Darwin(_) => Os::Macos,
-            OperatingSystem::IOS(_) => Os::Ios,
-            OperatingSystem::Netbsd => Os::NetBsd,
-            OperatingSystem::Freebsd => Os::FreeBsd,
-            OperatingSystem::Openbsd => Os::OpenBsd,
-            OperatingSystem::Dragonfly => Os::Dragonfly,
-            OperatingSystem::Solaris => Os::Solaris,
-            OperatingSystem::Illumos => Os::Illumos,
-            OperatingSystem::Haiku => Os::Haiku,
-            OperatingSystem::Emscripten => Os::Emscripten,
-            OperatingSystem::Wasi | OperatingSystem::WasiP1 | OperatingSystem::WasiP2 => Os::Wasi,
-            OperatingSystem::Aix => Os::Aix,
-            OperatingSystem::Hurd => Os::Hurd,
-            OperatingSystem::Cygwin => Os::Cygwin,
-            unsupported => bail!("The operating system {:?} is not supported", unsupported),
-        };
+        let os = Os::FreeBsd;
@@ -362,3 +338,3 @@ impl Target {
         };
-        target.cross_compiling = is_cross_compiling(&target)?;
+        target.cross_compiling = false;
         Ok(target)
@@ -482,3 +458,3 @@ impl Target {
             Os::Ios => "ios",
-            Os::FreeBsd => "freebsd",
+            Os::FreeBsd => "midnightbsd",
             Os::NetBsd => "netbsd",
