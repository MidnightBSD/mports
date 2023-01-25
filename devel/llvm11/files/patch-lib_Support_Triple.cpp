--- lib/Support/Triple.cpp.orig	2022-06-02 10:53:18.448801000 -0400
+++ lib/Support/Triple.cpp	2022-06-02 10:54:10.142847000 -0400
@@ -174,7 +174,7 @@
 
 StringRef Triple::getOSTypeName(OSType Kind) {
   switch (Kind) {
-  case UnknownOS: return "unknown";
+  case UnknownOS: return "freebsd";
 
   case Ananas: return "ananas";
   case CloudABI: return "cloudabi";
@@ -486,6 +486,7 @@
     .StartsWith("darwin", Triple::Darwin)
     .StartsWith("dragonfly", Triple::DragonFly)
     .StartsWith("freebsd", Triple::FreeBSD)
+    .StartsWith("midnightbsd", Triple::FreeBSD)
     .StartsWith("fuchsia", Triple::Fuchsia)
     .StartsWith("ios", Triple::IOS)
     .StartsWith("kfreebsd", Triple::KFreeBSD)
