--- ./Makefile.PL.orig	Tue Aug 14 16:06:35 2007
+++ ./Makefile.PL	Tue Aug 14 16:07:25 2007
@@ -37,7 +37,7 @@
         }
     }
     
-    if ($write_ini_ok) {
+    if (0) {
         $script =~ s/install :: (.*)$/install :: $1 install_sax_pureperl/m;
         $script .= <<"INSTALL";
 
