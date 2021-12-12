--- src/bootstrap/native.rs.orig	2019-02-28 03:53:34.000000000 -0500
+++ src/bootstrap/native.rs	2021-12-10 13:07:30.702984000 -0500
@@ -222,6 +222,8 @@
                cfg.define("CMAKE_SYSTEM_NAME", "NetBSD");
             } else if target.contains("freebsd") {
                cfg.define("CMAKE_SYSTEM_NAME", "FreeBSD");
+            } else if target.contains("midnightbsd") {
+               cfg.define("CMAKE_SYSTEM_NAME", "FreeBSD");
             }
 
             cfg.define("LLVM_NATIVE_BUILD", builder.llvm_out(builder.config.build).join("build"));
