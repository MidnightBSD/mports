--- ./Makefile.PL.orig	Fri Feb  9 11:22:34 2007
+++ ./Makefile.PL	Sun Apr 29 17:10:56 2007
@@ -32,7 +32,7 @@
 else {
     $WIN32   = 0;
     $FLAVOUR = 'Unix';
-    $PREFIX  = '/usr/local/tt2';
+    $PREFIX  = '/usr/local/share/tt2';
     $IMAGES  = '/tt2/images';
     $MAKE    = 'make';
 }
@@ -187,20 +187,20 @@
     return '' unless $main::TT_PREFIX;
     my $amble =<<'EOF';
 tt2_install ::
-	@$(PERL) bin/tt2inst -v "$(TT_PREFIX)"
+	@$(PERL) bin/tt2inst -v "$(DESTDIR)$(TT_PREFIX)"
 
 tt2_splash ::
-	@$(PERL) -I$(INST_LIB) -I$(INST_ARCHLIB) bin/gifsplash -v -i "$(TT_PREFIX)"
+	@$(PERL) -I$(INST_LIB) -I$(INST_ARCHLIB) bin/gifsplash -v -i "$(DESTDIR)$(TT_PREFIX)"
 
 EOF
     $amble .=<<EOF if $main::TT_BUILD_DOCS;
 tt2_html_docs ::
-	\@\$(PERL) -I\$(INST_LIB) -I\$(INST_ARCHLIB) bin/ttree -v -f "\$(TT_PREFIX)/$TT_DOCS_CFG"
+	\@\$(PERL) -I\$(INST_LIB) -I\$(INST_ARCHLIB) bin/ttree -v -f "\$(DESTDIR)\$(TT_PREFIX)/$TT_DOCS_CFG" -s \$(DESTDIR)\$(TT_PREFIX)/docs/src -d \$(DESTDIR)\$(TT_PREFIX)/docs/html -l \$(DESTDIR)\$(TT_PREFIX)/docs/style/splash -l \$(DESTDIR)\$(TT_PREFIX)/docs/lib -l \$(DESTDIR)\$(TT_PREFIX)/templates
 
 EOF
     $amble .=<<EOF if $main::TT_EXAMPLES;
 tt2_examples ::
-	\@\$(PERL) -I\$(INST_LIB) -I\$(INST_ARCHLIB) bin/ttree -v -f "\$(TT_PREFIX)/$TT_EXAMPLE_CFG"
+	\@\$(PERL) -I\$(INST_LIB) -I\$(INST_ARCHLIB) bin/ttree -v -f "\$(DESTDIR)\$(TT_PREFIX)/$TT_EXAMPLE_CFG" -s \$(DESTDIR)\$(TT_PREFIX)/examples/src -d \$(DESTDIR)\$(TT_PREFIX)/examples/html -l \$(DESTDIR)\$(TT_PREFIX)/examples/lib -l \$(DESTDIR)\$(TT_PREFIX)/templates
 
 EOF
     return $amble;
