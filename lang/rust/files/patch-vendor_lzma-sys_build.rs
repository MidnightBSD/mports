--- vendor/lzma-sys/build.rs.orig	2021-12-11 20:18:01.227423000 -0500
+++ vendor/lzma-sys/build.rs	2021-12-11 20:21:32.199469000 -0500
@@ -114,6 +114,7 @@
         cmd.arg("--disable-shared");
         cmd.arg("--disable-nls");
         cmd.arg("--disable-rpath");
+ 
 
         if target.contains("windows") {
             cmd.arg("--enable-threads=win95");
@@ -157,7 +158,7 @@
 fn make(host: &String) -> Command {
     let mut cmd = if host.contains("bitrig") || host.contains("dragonfly") ||
         host.contains("freebsd") || host.contains("netbsd") ||
-        host.contains("openbsd") || host.contains("solaris") {
+        host.contains("openbsd") || host.contains("solaris") || host.contains("midnightbsd") {
 
         Command::new("gmake")
     } else {
