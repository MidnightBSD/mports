--- src/llvm-project/llvm/lib/Support/Triple.cpp.orig	2020-08-27 22:25:58.226702000 -0400
+++ src/llvm-project/llvm/lib/Support/Triple.cpp	2020-08-27 22:29:52.417662000 -0400
@@ -486,6 +486,7 @@
     .StartsWith("darwin", Triple::Darwin)
     .StartsWith("dragonfly", Triple::DragonFly)
     .StartsWith("freebsd", Triple::FreeBSD)
+    .StartsWith("midnightbsd", Triple::FreeBSD)
     .StartsWith("fuchsia", Triple::Fuchsia)
     .StartsWith("ios", Triple::IOS)
     .StartsWith("kfreebsd", Triple::KFreeBSD)
