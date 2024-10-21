--- cargo-crates/libgit2-sys-0.15.2+1.6.4/build.rs.orig	2006-07-23 21:21:28.000000000 -0400
+++ cargo-crates/libgit2-sys-0.15.2+1.6.4/build.rs	2024-10-21 16:17:11.314553000 -0400
@@ -14,7 +14,7 @@
     let try_to_use_system_libgit2 = !vendored && !zlib_ng_compat;
     if try_to_use_system_libgit2 {
         let mut cfg = pkg_config::Config::new();
-        if let Ok(lib) = cfg.range_version("1.6.4".."1.7.0").probe("libgit2") {
+        if let Ok(lib) = cfg.range_version("1.6.4".."1.8.0").probe("libgit2") {
             for include in &lib.include_paths {
                 println!("cargo:root={}", include.display());
             }
