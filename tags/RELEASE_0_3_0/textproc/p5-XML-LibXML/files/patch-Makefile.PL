--- Makefile.PL.orig	Sat Oct 11 19:13:52 2008
+++ Makefile.PL	Sat Oct 11 19:14:06 2008
@@ -319,24 +319,6 @@
     return $str;
 }
 
-sub MY::install {
-   package MY;
-   my $script = shift->SUPER::install(@_);
-   unless ( $::skipsaxinstall ) {
-     $script =~ s/install :: (.*)$/install :: $1 install_sax_driver/m;
-     $script .= <<"INSTALL";
-
-install_sax_driver :
-\t\@\$(PERL) -I\$(INSTALLSITELIB) -MXML::SAX -e "XML::SAX->add_parser(q(XML::LibXML::SAX::Parser))->save_parsers()"
-\t\@\$(PERL) -I\$(INSTALLSITELIB) -MXML::SAX -e "XML::SAX->add_parser(q(XML::LibXML::SAX))->save_parsers()"
-
-INSTALL
-   } else {
-     warn "Note: 'make install' will skip XML::LibXML::SAX registration with XML::SAX!\n";
-   }
-   return $script;
-}
-
 sub MY::test {
    package MY;
    my $script = shift->SUPER::test(@_);
