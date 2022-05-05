--- projects/openmp/runtime/tools/lib/Platform.pm.orig	2022-05-05 03:52:53 UTC
+++ projects/openmp/runtime/tools/lib/Platform.pm
@@ -239,6 +239,9 @@ sub target_options() {
     } elsif ( $operating_system eq "FreeBSD" ) {
         # Host OS resembles Linux.
         $_host_os = "lin";
+    } elsif ( $operating_system eq "MidnightBSD" ) {
+        # Host OS resembles Linux.
+        $_host_os = "lin";
     } elsif ( $operating_system eq "NetBSD" ) {
         # Host OS resembles Linux.
         $_host_os = "lin";
