--- src/target.rs.orig	2024-03-21 08:30:28.000000000 -0400
+++ src/target.rs	2024-07-18 20:42:36.087817000 -0400
@@ -30,6 +30,7 @@
     Haiku,
     Emscripten,
     Wasi,
+    MidnightBsd,
 }
 
 impl fmt::Display for Os {
@@ -39,6 +40,7 @@
             Os::Windows => write!(f, "Windows"),
             Os::Macos => write!(f, "macOS"),
             Os::FreeBsd => write!(f, "FreeBSD"),
+            Os::MidnightBsd => write!(f, "MidnightBSD"),
             Os::NetBsd => write!(f, "NetBSD"),
             Os::OpenBsd => write!(f, "OpenBSD"),
             Os::Dragonfly => write!(f, "DragonFly"),
@@ -152,7 +154,7 @@
         ],
         Os::Windows => vec![Arch::X86, Arch::X86_64, Arch::Aarch64],
         Os::Macos => vec![Arch::Aarch64, Arch::X86_64],
-        Os::FreeBsd | Os::NetBsd => vec![
+        Os::FreeBsd | Os::MidnightBsd | Os::NetBsd => vec![
             Arch::Aarch64,
             Arch::Armv6L,
             Arch::Armv7L,
@@ -375,6 +377,7 @@
             Os::Emscripten => "emscripten",
             // This isn't real, there's no sys.platform here
             Os::Wasi => "wasi",
+            Os::MidnightBsd => "midnightbsd",
         }
     }
 
@@ -450,6 +453,7 @@
             Os::Linux
             | Os::Macos
             | Os::FreeBsd
+            | Os::MidnightBsd
             | Os::NetBsd
             | Os::OpenBsd
             | Os::Dragonfly
