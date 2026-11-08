--- src/target/mod.rs.orig
+++ src/target/mod.rs
@@ -529,6 +529,13 @@
             Os::Linux => "linux",
             Os::Macos => "darwin",
             Os::Ios => "ios",
+            Os::FreeBsd
+                if self.triple == self.rustc_version.host
+                    && PlatformInfo::new()
+                        .is_ok_and(|info| info.sysname() == "MidnightBSD") =>
+            {
+                "midnightbsd"
+            }
             Os::FreeBsd => "freebsd",
             Os::NetBsd => "netbsd",
             Os::OpenBsd => "openbsd",
