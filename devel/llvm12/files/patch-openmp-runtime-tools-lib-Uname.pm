--- openmp/runtime/tools/lib/Uname.pm.orig	2023-12-16 16:23:57.184203000 -0500
+++ openmp/runtime/tools/lib/Uname.pm	2023-12-16 16:24:24.325265000 -0500
@@ -383,6 +383,8 @@
     $values{ operating_system } = "MS Windows";
 } elsif ( $values{ kernel_name } =~ m{\AFreeBSD} ) {
     $values{ operating_system } = "FreeBSD";
+} elsif ( $values{ kernel_name } =~ m{\AMidnightBSD} ) {
+    $values{ operating_system } = "MidnightBSD";
 } elsif ( $values{ kernel_name } =~ m{\ANetBSD} ) {
     $values{ operating_system } = "NetBSD";
 } else {
