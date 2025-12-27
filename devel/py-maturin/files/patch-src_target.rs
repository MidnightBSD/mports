--- src/target.rs.orig	2024-09-25 23:06:33.000000000 -0400
+++ src/target.rs	2025-12-27 00:44:50.084404000 -0500
@@ -1,4 +1,3 @@
-use crate::cross_compile::is_cross_compiling;
 use crate::python_interpreter::InterpreterKind;
 use crate::python_interpreter::InterpreterKind::{CPython, GraalPy, PyPy};
 use crate::PlatformTag;
@@ -223,7 +222,7 @@
     /// Fails if the target triple isn't supported
     pub fn from_target_triple(target_triple: Option<String>) -> Result<Self> {
         use target_lexicon::{
-            ArmArchitecture, Mips32Architecture, Mips64Architecture, OperatingSystem,
+            ArmArchitecture, Mips32Architecture, Mips64Architecture, 
         };
 
         let rustc_version = rustc_version_meta()?;
@@ -240,23 +239,7 @@
             (platform, host_triple.clone())
         };
 
-        let os = match platform.operating_system {
-            OperatingSystem::Linux => Os::Linux,
-            OperatingSystem::Windows => Os::Windows,
-            OperatingSystem::MacOSX { .. } | OperatingSystem::Darwin => Os::Macos,
-            OperatingSystem::Ios => Os::Ios,
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
-            unsupported => bail!("The operating system {:?} is not supported", unsupported),
-        };
+        let os = Os::FreeBsd;
 
         let arch = match platform.architecture {
             Architecture::X86_64 | Architecture::X86_64h => Arch::X86_64,
@@ -301,7 +284,7 @@
             user_specified: target_triple.is_some(),
             cross_compiling: false,
         };
-        target.cross_compiling = is_cross_compiling(&target)?;
+        target.cross_compiling = false;
         Ok(target)
     }
 
@@ -415,7 +398,7 @@
             Os::Linux => "linux",
             Os::Macos => "darwin",
             Os::Ios => "darwin",
-            Os::FreeBsd => "freebsd",
+            Os::FreeBsd => "midnightbsd",
             Os::NetBsd => "netbsd",
             Os::OpenBsd => "openbsd",
             Os::Dragonfly => "dragonfly",
