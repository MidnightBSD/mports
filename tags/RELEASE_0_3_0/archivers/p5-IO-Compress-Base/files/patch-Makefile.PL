--- ./Makefile.PL.orig	Wed Sep  3 09:13:04 2008
+++ ./Makefile.PL	Fri Oct 10 13:55:57 2008
@@ -36,12 +36,7 @@
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
