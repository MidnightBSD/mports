--- ./Makefile.PL.orig	Fri Oct 10 14:01:19 2008
+++ ./Makefile.PL	Fri Oct 10 14:02:29 2008
@@ -50,13 +50,7 @@
     ),
 
     INSTALLDIRS => ($] >= 5.009 ? 'perl' : 'site'),
-
-    (
-    $] >= 5.009 && ! $ENV{PERL_CORE}
-        ? (INST_LIB    => 'blib/arch')
-        : ()
-    ),
-
+    INST_LIB => 'blib/arch',
 
     ((ExtUtils::MakeMaker->VERSION() gt '6.30') ?
         ('LICENSE'  => 'perl')         : ()),    
