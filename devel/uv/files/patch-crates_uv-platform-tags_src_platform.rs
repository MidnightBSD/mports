--- crates/uv-platform-tags/src/platform.rs.orig	2026-05-21 21:21:08 UTC
+++ crates/uv-platform-tags/src/platform.rs
@@ -59,2 +59,3 @@
             Os::FreeBsd { .. } => "FreeBSD",
+            Os::MidnightBsd { .. } => "MidnightBSD",
             Os::NetBsd { .. } => "NetBSD",
@@ -95,2 +96,5 @@
     },
+    MidnightBsd {
+        release: String,
+    },
     NetBsd {
@@ -129,2 +133,3 @@
             Self::FreeBsd { .. } => write!(f, "freebsd"),
+            Self::MidnightBsd { .. } => write!(f, "midnightbsd"),
             Self::NetBsd { .. } => write!(f, "netbsd"),
