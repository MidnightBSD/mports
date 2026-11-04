Backport upstream fixes for CVE-2026-117500 and CVE-2026-117501.

https://github.com/libwww-perl/HTTP-Body/commit/9ab46daaede02fb13ea55a7e3ede34c8b918d8ca
https://github.com/libwww-perl/HTTP-Body/commit/7c6dc1ecd49e30ac405a3959c606ba389718f556
https://github.com/libwww-perl/HTTP-Body/commit/3abc958d78bd84bf4abb87bad79b9432eab7e694

--- lib/HTTP/Body/MultiPart.pm.orig	2026-10-26 17:28:04 UTC
+++ lib/HTTP/Body/MultiPart.pm
@@ -287,7 +287,11 @@ sub parse_body {
 
 =cut
 
-our $basename_regexp = qr/[^.]+(\.[^\\\/]+)$/;
+# The default is also kept here: while $basename_regexp still holds it, the
+# suffix is found by _default_suffix, a string search with the same result.
+my $default_basename_regexp = qr/[^.]+(\.[^\\\/]+)$/;
+
+our $basename_regexp = $default_basename_regexp;
 our $file_temp_suffix = '.upload';
 our $file_temp_template;
 our %file_temp_parameters;
@@ -312,11 +316,27 @@ sub handler {
             $part->{filename} = $filename;
 
             if ( $filename ne "" ) {
-                my $basename = (File::Spec->splitpath($filename))[2];
-                my $suffix = $basename =~ $basename_regexp ? $1 : q{};
+                my $suffix = $file_temp_suffix;
 
+                unless ($suffix) {
+                    my $basename = (File::Spec->splitpath($filename))[2];
+
+                    # A suffix can be no longer than a file name, so only the end
+                    # of a long basename is looked at.  On the whole of a hostile
+                    # one a regexp like the default backtracks in time quadratic
+                    # in its length: seconds per part, once for every part.
+                    $basename = substr( $basename, -255 ) if length($basename) > 255;
+
+                    if ( ref $basename_regexp && $basename_regexp == $default_basename_regexp ) {
+                        $suffix = _default_suffix($basename);
+                    }
+                    else {
+                        $suffix = $basename =~ $basename_regexp ? $1 : q{};
+                    }
+                }
+
                 my $fh = File::Temp->new(
-                    UNLINK => 0, DIR => $self->tmpdir, SUFFIX => ($file_temp_suffix||$suffix),
+                    UNLINK => 0, DIR => $self->tmpdir, SUFFIX => $suffix,
                     ( $file_temp_template ? ( TEMPLATE => $file_temp_template ) : () ),
                     %file_temp_parameters,
                 );
@@ -354,6 +374,27 @@ sub handler {
             $self->part_data( $part->{name}, $part )
         }
     }
+}
+
+# The suffix the default $basename_regexp captures, found without a regexp,
+# in time linear in the basename's length.  It starts at the first dot after
+# the last slash or backslash that follows a byte other than a dot, and runs
+# to the end; a dot that is the last byte gives no suffix.
+sub _default_suffix {
+    my ($basename) = @_;
+
+    my $last = length($basename) - 1;
+    my $dot  = rindex( $basename, '/' );
+    my $back = rindex( $basename, '\\' );
+    $dot = $back if $back > $dot;
+
+    while ( ( $dot = index( $basename, '.', $dot + 1 ) ) >= 0 ) {
+        return q{} if $dot == $last;
+        return substr( $basename, $dot )
+            if $dot > 0 && substr( $basename, $dot - 1, 1 ) ne '.';
+    }
+
+    return q{};
 }
 
 =back
