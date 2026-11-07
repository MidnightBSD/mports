--- crates/uv-platform-tags/src/platform_tag.rs.orig	2026-05-21 21:21:08 UTC
+++ crates/uv-platform-tags/src/platform_tag.rs
@@ -123,2 +123,4 @@
     },
+    /// Ex) `midnightbsd_4_0_amd64`
+    MidnightBsd { release_arch: ReleaseArch },
 }
@@ -143,2 +145,3 @@
             Self::FreeBsd { .. } => Some("FreeBSD"),
+            Self::MidnightBsd { .. } => Some("MidnightBSD"),
             Self::NetBsd { .. } => Some("NetBSD"),
@@ -460,2 +463,3 @@
             Self::FreeBsd { release_arch } => write!(f, "freebsd_{release_arch}"),
+            Self::MidnightBsd { release_arch } => write!(f, "midnightbsd_{release_arch}"),
             Self::NetBsd { release_arch } => write!(f, "netbsd_{release_arch}"),
@@ -717,2 +721,17 @@
             return Ok(Self::Android { api_level, abi });
+        }
+
+        if let Some(rest) = s.strip_prefix("midnightbsd_") {
+            // Ex) midnightbsd_4_0_amd64 or midnightbsd_4_2_i386
+            if rest.is_empty() {
+                return Err(ParsePlatformTagError::InvalidFormat {
+                    platform: "midnightbsd",
+                    tag: s.to_string(),
+                });
+            }
+            return Ok(Self::MidnightBsd {
+                release_arch: rest
+                    .parse::<ReleaseArch>()
+                    .map_err(|_| ParsePlatformTagError::InvalidCharacters { tag: s.to_string() })?,
+            });
         }
@@ -1178,2 +1197,17 @@
     #[test]
+    fn midnightbsd_platform_identity() {
+        for value in ["midnightbsd_4_0_amd64", "midnightbsd_4_2_i386"] {
+            let tag = PlatformTag::from_str(value).unwrap();
+            assert_eq!(tag.to_string(), value);
+            assert_eq!(tag.pretty(), Some("MidnightBSD"));
+            assert!(matches!(tag, PlatformTag::MidnightBsd { .. }));
+        }
+        let midnight = PlatformTag::from_str("midnightbsd_4_0_amd64").unwrap();
+        let freebsd = PlatformTag::from_str("freebsd_4_0_amd64").unwrap();
+        assert_ne!(midnight, freebsd);
+        assert!(PlatformTag::from_str("midnightbsd_").is_err());
+        assert!(PlatformTag::from_str("midnightbsd_4/0_amd64").is_err());
+    }
+
+    #[test]
     fn freebsd_platform() {
