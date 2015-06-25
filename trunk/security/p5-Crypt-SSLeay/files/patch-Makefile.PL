--- Makefile.PL.orig	2015-06-24 21:41:52.962658638 -0400
+++ Makefile.PL	2015-06-24 21:43:35.591846730 -0400
@@ -222,16 +222,7 @@
 }
 
 sub is_live_test_wanted {
-    print <<EO_CHUNK;
-The test suite can attempt to connect to public servers to ensure that the
-code is working properly. If you are behind a strict firewall or have no
-network connectivity, these tests may fail (through no fault of the code).
-EO_CHUNK
-    my $wanted = prompt "Do you want to run the live tests (y/N)?", 'N';
-    $wanted =~ s/\A\s+//;
-    $wanted =~ s/\s+\z//;
-
-    return $wanted =~ /\Ay(?:es)?\z/i ? 1 : 0;
+    return 0;
 }
 
 sub write_test_config {
