--- llvm/lib/Support/Triple.cpp.orig	2023-12-19 08:17:17.174393000 -0500
+++ llvm/lib/Support/Triple.cpp	2023-12-19 08:17:45.320613000 -0500
@@ -500,6 +500,7 @@
     .StartsWith("darwin", Triple::Darwin)
     .StartsWith("dragonfly", Triple::DragonFly)
     .StartsWith("freebsd", Triple::FreeBSD)
+    .StartsWith("midnightbsd", Triple::FreeBSD)
     .StartsWith("fuchsia", Triple::Fuchsia)
     .StartsWith("ios", Triple::IOS)
     .StartsWith("kfreebsd", Triple::KFreeBSD)
