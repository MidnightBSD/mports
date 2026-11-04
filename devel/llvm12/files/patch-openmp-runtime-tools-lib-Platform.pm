--- openmp/runtime/tools/lib/Platform.pm.orig	2023-12-16 16:24:02.389342000 -0500
+++ openmp/runtime/tools/lib/Platform.pm	2023-12-16 16:24:43.179578000 -0500
@@ -239,6 +239,9 @@
     } elsif ( $operating_system eq "FreeBSD" ) {
         # Host OS resembles Linux.
         $_host_os = "lin";
+    } elsif ( $operating_system eq "MidnightBSD" ) {
+        # Host OS resembles Linux.
+        $_host_os = "lin";
     } elsif ( $operating_system eq "NetBSD" ) {
         # Host OS resembles Linux.
         $_host_os = "lin";
