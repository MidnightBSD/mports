--- projects/openmp/runtime/tools/lib/Uname.pm.orig	2022-05-05 03:52:47 UTC
+++ projects/openmp/runtime/tools/lib/Uname.pm
@@ -383,6 +383,8 @@ if ( 0 ) {
     $values{ operating_system } = "MS Windows";
 } elsif ( $values{ kernel_name } =~ m{\AFreeBSD} ) {
     $values{ operating_system } = "FreeBSD";
+} elsif ( $values{ kernel_name } =~ m{\AMidnighBSD} ) {
+    $values{ operating_system } = "FreeBSD";
 } elsif ( $values{ kernel_name } =~ m{\ANetBSD} ) {
     $values{ operating_system } = "NetBSD";
 } else {
