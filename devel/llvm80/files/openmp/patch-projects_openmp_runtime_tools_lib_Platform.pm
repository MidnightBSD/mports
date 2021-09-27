--- projects/openmp/runtime/tools/lib/Platform.pm.orig	2021-09-27 05:03:08 UTC
+++ projects/openmp/runtime/tools/lib/Platform.pm
@@ -235,6 +235,9 @@ sub target_options() {
     } elsif ( $operating_system eq "FreeBSD" ) {
         # Host OS resembles Linux.
         $_host_os = "lin";
+    } elsif ( $operating_system eq "MidnightBSD" ) {
+        # Host OS resembles Linux.
+        $_host_os = "lin";
     } elsif ( $operating_system eq "NetBSD" ) {
         # Host OS resembles Linux.
         $_host_os = "lin";
