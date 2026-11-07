--- crates/uv-platform-tags/src/tags.rs.orig	2026-05-21 21:21:08 UTC
+++ crates/uv-platform-tags/src/tags.rs
@@ -675,2 +675,15 @@
         (Os::Windows, Arch::Aarch64) => vec![PlatformTag::WinArm64],
+        (Os::MidnightBsd { release }, arch) => {
+            let release_tag = release.replace(['.', '-'], "_").to_lowercase();
+            let arch_tag = arch.machine();
+            let release_arch = format!("{release_tag}_{arch_tag}");
+            vec![PlatformTag::MidnightBsd {
+                release_arch: release_arch.parse::<ReleaseArch>().map_err(|error| {
+                    PlatformError::InvalidReleaseArch {
+                        release_arch,
+                        error,
+                    }
+                })?,
+            }]
+        }
         (Os::FreeBsd { release }, arch) => {
@@ -1487,2 +1500,20 @@
         );
+    }
+
+    #[test]
+    fn test_midnightbsd_native_platform_tags() {
+        for (release, arch, expected) in [
+            ("4.0", Arch::X86_64, "midnightbsd_4_0_amd64"),
+            ("4.2", Arch::X86_64, "midnightbsd_4_2_amd64"),
+            ("4.0", Arch::X86, "midnightbsd_4_0_i386"),
+        ] {
+            let tags = compatible_tags(&Platform::new(
+                Os::MidnightBsd { release: release.to_string() }, arch,
+            )).unwrap();
+            assert_eq!(tags.iter().map(ToString::to_string).collect::<Vec<_>>(), vec![expected]);
+            assert!(tags.iter().all(|tag| !matches!(tag, PlatformTag::FreeBsd { .. })));
+        }
+        assert!(compatible_tags(&Platform::new(
+            Os::MidnightBsd { release: "4/0".to_string() }, Arch::X86_64,
+        )).is_err());
     }
