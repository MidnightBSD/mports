--- Makefile.PL.orig	2012-02-05 16:51:05 -0500
+++ Makefile.PL	2012-02-05 16:51:57 -0500
@@ -491,6 +491,8 @@
             $str =~ s/\-L\'(.*?)\'/-L$1/sg;
             $str =~ s/\-L\"(.*?)\"/-L$1/sg;
 
+            $str =~ s/\-pthread/\-lpthread/s;
+
             $opt->{$param} = $str;
             $source->{$param} = "mysql_config";
             return;
