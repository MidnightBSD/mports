--- lib/ExtUtils/MM_Unix.pm.orig	2023-02-19 18:27:13 UTC
+++ lib/ExtUtils/MM_Unix.pm
@@ -34,7 +34,7 @@ BEGIN {
     $Is{SunOS4}  = $^O eq 'sunos';
     $Is{Solaris} = $^O eq 'solaris';
     $Is{SunOS}   = $Is{SunOS4} || $Is{Solaris};
-    $Is{BSD}     = ($^O =~ /^(?:free|net|open)bsd$/ or
+    $Is{BSD}     = ($^O =~ /^(?:free|midnight|net|open)bsd$/ or
                    grep( $^O eq $_, qw(bsdos interix dragonfly) )
                   );
     $Is{Android} = $^O =~ /android/;
