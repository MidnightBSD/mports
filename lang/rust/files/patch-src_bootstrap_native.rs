--- src/bootstrap/native.rs.orig	2018-05-07 13:31:28.000000000 -0400
+++ src/bootstrap/native.rs	2020-09-01 14:05:57.830656000 -0400
@@ -206,6 +206,8 @@
                cfg.define("CMAKE_SYSTEM_NAME", "NetBSD");
             } else if target.contains("freebsd") {
                cfg.define("CMAKE_SYSTEM_NAME", "FreeBSD");
+            } else if target.contains("midnightbsd") {
+               cfg.define("CMAKE_SYSTEM_NAME", "FreeBSD");
             }
 
             cfg.define("LLVM_NATIVE_BUILD", build.llvm_out(build.build).join("build"));
@@ -538,6 +540,7 @@
             "i686-apple-darwin" => "darwin-i386-cc",
             "i686-linux-android" => "android-x86",
             "i686-unknown-freebsd" => "BSD-x86-elf",
+            "i686-unknown-midnightbsd" => "BSD-x86-elf",
             "i686-unknown-linux-gnu" => "linux-elf",
             "i686-unknown-linux-musl" => "linux-elf",
             "i686-unknown-netbsd" => "BSD-x86-elf",
@@ -557,6 +560,7 @@
             "x86_64-apple-darwin" => "darwin64-x86_64-cc",
             "x86_64-linux-android" => "linux-x86_64",
             "x86_64-unknown-freebsd" => "BSD-x86_64",
+            "x86_64-unknown-midnightbsd" => "BSD-x86_64",
             "x86_64-unknown-dragonfly" => "BSD-x86_64",
             "x86_64-unknown-linux-gnu" => "linux-x86_64",
             "x86_64-unknown-linux-gnux32" => "linux-x32",
