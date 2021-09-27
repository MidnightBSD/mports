--- projects/openmp/runtime/tools/lib/Uname.pm.orig	2021-09-27 05:02:59 UTC
+++ projects/openmp/runtime/tools/lib/Uname.pm
@@ -382,6 +382,8 @@ if ( 0 ) {
     $values{ operating_system } = "MS Windows";
 } elsif ( $values{ kernel_name } =~ m{\AFreeBSD} ) {
     $values{ operating_system } = "FreeBSD";
+} elsif ( $values{ kernel_name } =~ m{\AMidnightBSD} ) {
+    $values{ operating_system } = "MidnightBSD";
 } elsif ( $values{ kernel_name } =~ m{\ANetBSD} ) {
     $values{ operating_system } = "NetBSD";
 } else {
