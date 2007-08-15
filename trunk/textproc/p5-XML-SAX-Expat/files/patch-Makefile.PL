--- Makefile.PL.orig	Wed Aug 15 00:48:04 2007
+++ Makefile.PL	Wed Aug 15 00:48:35 2007
@@ -14,18 +14,3 @@
                      },
 );
 
-
-## add ourselves to the list of installed parsers
-sub MY::install {
-    package MY;
-    my $script = shift->SUPER::install(@_);
-    $script =~ s/install :: (.*)$/install :: $1 install_sax_expat/m;
-    $script .= <<"INSTALL";
-
-install_sax_expat :
-\t\@\$(PERL) -MXML::SAX -e "XML::SAX->add_parser(q(XML::SAX::Expat))->save_parsers()"
-
-INSTALL
-
-    return $script;
-}
