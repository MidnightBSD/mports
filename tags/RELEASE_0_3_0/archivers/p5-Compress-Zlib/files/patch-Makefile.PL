--- ./Makefile.PL.orig	Fri Oct 10 14:08:59 2008
+++ ./Makefile.PL	Fri Oct 10 14:09:27 2008
@@ -44,12 +44,7 @@
     ),
 
     INSTALLDIRS => ($] >= 5.009 ? 'perl' : 'site'),
-
-    (
-    $] >= 5.009 && ! $ENV{PERL_CORE}
-        ? (INST_LIB    => 'blib/arch')
-        : ()
-    ),
+    INST_LIB    => 'blib/arch',
 
     ((ExtUtils::MakeMaker->VERSION() gt '6.30') ?
         ('LICENSE'  => 'perl')         : ()),    
