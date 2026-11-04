Backport upstream fixes for CVE-2026-117500 and CVE-2026-117501.

https://github.com/libwww-perl/HTTP-Body/commit/9ab46daaede02fb13ea55a7e3ede34c8b918d8ca
https://github.com/libwww-perl/HTTP-Body/commit/7c6dc1ecd49e30ac405a3959c606ba389718f556
https://github.com/libwww-perl/HTTP-Body/commit/3abc958d78bd84bf4abb87bad79b9432eab7e694

--- lib/HTTP/Body.pm.orig	2026-10-26 17:28:04 UTC
+++ lib/HTTP/Body.pm
@@ -96,6 +96,13 @@ larger one makes add croak.  The defaults are 32768 an
 The largest header block a multipart part may have, in bytes and in lines; a
 larger one makes add croak.  The defaults are 32768 and 100.
 
+=item $HTTP::Body::max_chunk_line_size
+
+The largest chunk-size line (size, extensions and CRLF) of a chunked body, in
+bytes; a longer one makes add croak.  The default is 1024.  A chunked body
+whose framing is malformed (a line that is no chunk-size line, a size that does
+not fit an integer, chunk data not followed by CRLF) makes add croak as well.
+
 =back
 
 =head1 METHODS
@@ -132,6 +139,9 @@ sub new {
         cleanup        => 0,
         buffer         => '',
         chunk_buffer   => '',
+        chunk_remaining => 0,
+        chunk_crlf     => 0,
+        chunk_eof      => 0,
         body           => undef,
         chunked        => !defined $content_length,
         content_length => defined $content_length ? $content_length : -1,
@@ -184,32 +194,88 @@ length before adding self.
 
 =cut
 
-# chunk-size [ chunk-ext ] CRLF.  The atomic group keeps the size digits from
-# backtracking into the rest of the line, which took quadratic time on a line
-# that does not end in CRLF.
-my $chunk_size_line = qr/^(?>([\da-fA-F]+))[^\n]*\x0D\x0A/;
+# chunk-size [ chunk-ext ] CRLF, matched against one line at a time.  The
+# atomic group keeps the size digits from backtracking into the rest of the
+# line, and the line length limit bounds what the rest can cost.
+my $chunk_size_line = qr/^(?>([\da-fA-F]+))[^\n]*\x0D\x0A\z/;
 
+our $max_chunk_line_size = 1024;
+
 sub add {
     my $self = shift;
 
     if ( $self->{chunked} ) {
-        $self->{chunk_buffer} .= $_[0];
 
-        # Stop once the zero-length chunk has ended the chunked stream: any
-        # trailing bytes (e.g. trailing headers) must not be reparsed as
-        # further chunks.  This is separate from the body parser's own state,
-        # which for multipart reaches 'done' at the closing boundary, before
-        # the zero chunk that records the final content length.
-        while ( !$self->{chunk_eof}
-            && $self->{chunk_buffer} =~ $chunk_size_line ) {
-            my $chunk_len  = hex($1);
-            # Length of the chunk-size line itself; the pattern is anchored at ^.
-            my $header_len = $+[0];
+        # Nothing after the zero-length chunk belongs to the body: trailing
+        # bytes must neither be reparsed as chunks nor pile up in the buffer.
+        return if $self->{chunk_eof};
 
-            if ( $chunk_len == 0 ) {
-                # Strip chunk len
-                substr( $self->{chunk_buffer}, 0, $header_len, '' );
+        $self->{chunk_buffer} .= $_[0] if defined $_[0];
 
+        while ( !$self->{chunk_eof} ) {
+
+            # Inside a chunk: pass its data on as it arrives, so that a chunk
+            # never needs as much memory as it is long.
+            if ( $self->{chunk_remaining} ) {
+                my $take = length $self->{chunk_buffer};
+                $take = $self->{chunk_remaining} if $take > $self->{chunk_remaining};
+
+                # wait for more calls to add()
+                return unless $take;
+
+                my $data = substr( $self->{chunk_buffer}, 0, $take, '' );
+                $self->{chunk_remaining} -= $take;
+                $self->{length}          += $take;
+
+                # Once the body parser is done (multipart is, at its close
+                # delimiter) the rest of the body is consumed but not kept.
+                unless ( $self->{state} eq 'done' ) {
+                    $self->{buffer} .= $data;
+                    $self->spin;
+                }
+
+                next;
+            }
+
+            # The CRLF that ends the data of the chunk just read.
+            if ( $self->{chunk_crlf} ) {
+                return if length( $self->{chunk_buffer} ) < 2;
+
+                unless ( substr( $self->{chunk_buffer}, 0, 2, '' ) eq "\x0D\x0A" ) {
+                    Carp::croak('Chunk data not followed by CRLF');
+                }
+
+                $self->{chunk_crlf} = 0;
+            }
+
+            # A chunk-size line.  Its length is checked before it is complete,
+            # so that an endless line can not grow the buffer.
+            my $eol      = index( $self->{chunk_buffer}, "\x0A" );
+            my $line_len = $eol >= 0 ? $eol + 1 : length $self->{chunk_buffer};
+
+            if ( $max_chunk_line_size && $line_len > $max_chunk_line_size ) {
+                Carp::croak("Chunk size line exceeds $max_chunk_line_size bytes");
+            }
+
+            # wait for the rest of the line
+            return if $eol < 0;
+
+            my $line = substr( $self->{chunk_buffer}, 0, $line_len, '' );
+
+            unless ( $line =~ $chunk_size_line ) {
+                Carp::croak('Invalid chunk size line');
+            }
+
+            # hex() of a size that does not fit an integer warns and returns a
+            # float, which no buffer length would ever reach.
+            ( my $digits = $1 ) =~ s/^0+//;
+            if ( length($digits) > 15 ) {
+                Carp::croak('Chunk size too large');
+            }
+
+            my $chunk_len = hex($digits);
+
+            if ( $chunk_len == 0 ) {
                 # End of data, there may be trailing headers
                 if (  my ($headers) = $self->{chunk_buffer} =~ m/(.*)\x0D\x0A/s ) {
                     if ( my $message = HTTP::Message->parse( $headers ) ) {
@@ -223,36 +289,18 @@ sub add {
                 # Set content_length equal to the amount of data we read,
                 # so the spin methods can finish up.
                 $self->{content_length} = $self->{length};
-            }
-            else {
-                # Make sure we have the whole chunk body plus its trailing CRLF
-                # beyond the chunk-size line before we consume it. The old test
-                # measured the whole buffer, size line included, so a read that
-                # split a chunk left the parser taking it short and reparsing the
-                # leftover bytes as the next chunk-size line (never completing).
-                if ( length( $self->{chunk_buffer} ) >= $header_len + $chunk_len + 2 ) {
-                    # Strip chunk len
-                    substr( $self->{chunk_buffer}, 0, $header_len, '' );
 
-                    # Pull chunk data out of chunk buffer into real buffer
-                    $self->{buffer} .= substr $self->{chunk_buffer}, 0, $chunk_len, '';
-
-                    # Strip remaining CRLF
-                    $self->{chunk_buffer} =~ s/^\x0D\x0A//;
-
-                    $self->{length} += $chunk_len;
+                unless ( $self->{state} eq 'done' ) {
+                    $self->spin;
                 }
-                else {
-                    # Not enough data for this chunk, wait for more calls to add()
-                    return;
-                }
+
+                return;
             }
-            
-            unless ( $self->{state} eq 'done' ) {
-                $self->spin;
-            }
+
+            $self->{chunk_remaining} = $chunk_len;
+            $self->{chunk_crlf}      = 1;
         }
-        
+
         return;
     }
     
@@ -523,7 +571,10 @@ The regexp used to work out the uploaded file's extens
 =item $HTTP::Body::MultiPart::basename_regexp
 
 The regexp used to work out the uploaded file's extension.  It only matters
-when C<file_temp_suffix> is undefined.
+when C<file_temp_suffix> is undefined, and is matched against the last 255
+bytes of the uploaded file's basename, which is as long as a suffix can be.
+The default, C<qr/[^.]+(\.[^\\\/]+)$/>, is not run as a regexp: as long as the
+variable still holds it, a string search with the same result is used.
 
 =item $HTTP::Body::MultiPart::file_temp_template
 
