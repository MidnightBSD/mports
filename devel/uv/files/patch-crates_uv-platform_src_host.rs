--- crates/uv-platform/src/host.rs.orig	2026-05-21 21:21:08 UTC
+++ crates/uv-platform/src/host.rs
@@ -13,2 +13,4 @@
     Darwin,
+    /// BSD kernel name from `uname -s` (including MidnightBSD).
+    Bsd(String),
     /// Windows.
@@ -32,2 +34,7 @@
         }
+        #[cfg(target_os = "freebsd")]
+        {
+            let uname = rustix::system::uname();
+            Some(Self::Bsd(uname.sysname().to_str().ok()?.to_string()))
+        }
         #[cfg(target_os = "windows")]
@@ -36,3 +43,8 @@
         }
-        #[cfg(not(any(target_os = "linux", target_os = "macos", target_os = "windows")))]
+        #[cfg(not(any(
+            target_os = "linux",
+            target_os = "macos",
+            target_os = "freebsd",
+            target_os = "windows"
+        )))]
         {
@@ -46,3 +58,3 @@
         match self {
-            Self::Linux(os_type) => f.write_str(os_type),
+            Self::Linux(os_type) | Self::Bsd(os_type) => f.write_str(os_type),
             Self::Darwin => f.write_str("Darwin"),
@@ -246,2 +258,9 @@
         assert_eq!(os_type, OsType::Darwin);
+        #[cfg(target_os = "freebsd")]
+        {
+            let uname = rustix::system::uname();
+            let actual = uname.sysname().to_str().unwrap();
+            assert_eq!(os_type, OsType::Bsd(actual.to_string()));
+            assert_eq!(os_type.to_string(), actual);
+        }
         #[cfg(target_os = "windows")]
