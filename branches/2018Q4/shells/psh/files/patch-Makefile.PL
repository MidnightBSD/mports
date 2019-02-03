--- ./Makefile.PL.orig	Thu Jan 16 14:11:38 2003
+++ ./Makefile.PL	Thu May 10 10:32:16 2007
@@ -22,7 +22,7 @@
 	my $tmp="
 
 install ::
-	\$(PERL) postinstall.pl \$(SITEPREFIX) \$(PREFIX)
+	\$(PERL) postinstall.pl \$(DESTDIR)\$(SITEPREFIX) \$(DESTDIR)\$(PREFIX)
 
 
 lib/Psh/StrategyBunch.pm : $sb_depends
@@ -67,6 +67,7 @@
 
 WriteMakefile (
 	NAME         => 'psh',
+	PREFIX       => '${TRUE_PREFIX}',
 	VERSION_FROM => 'lib/Psh.pm',
 	AUTHOR       => 'Gregor N. Purdy (gregor@focusresearch.com)',
 	ABSTRACT     => 'Perl Shell',
