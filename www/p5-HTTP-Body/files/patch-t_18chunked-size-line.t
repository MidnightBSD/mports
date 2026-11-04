Backport upstream fixes for CVE-2026-117500 and CVE-2026-117501.

https://github.com/libwww-perl/HTTP-Body/commit/9ab46daaede02fb13ea55a7e3ede34c8b918d8ca
https://github.com/libwww-perl/HTTP-Body/commit/7c6dc1ecd49e30ac405a3959c606ba389718f556
https://github.com/libwww-perl/HTTP-Body/commit/3abc958d78bd84bf4abb87bad79b9432eab7e694

--- t/18chunked-size-line.t.orig	2026-10-26 17:28:04 UTC
+++ t/18chunked-size-line.t
@@ -3,7 +3,7 @@ use warnings;
 use strict;
 use warnings;
 
-use Test::More tests => 3;
+use Test::More tests => 5;
 
 use HTTP::Body;
 use Time::HiRes qw/ time /;
@@ -20,8 +20,17 @@ my $ct = 'application/x-www-form-urlencoded';
 {
     # A size line whose first LF has no CR before it never matches; the
     # old pattern backtracked over it in time quadratic in its length.
+    # Without the line length limit the line reaches the pattern whole.
+    local $HTTP::Body::max_chunk_line_size = 0;
     my $body = HTTP::Body->new( $ct, undef );
     my $t    = time;
-    $body->add( ( '1' x 100_000 ) . "\n\r\n" );
+    eval { $body->add( ( '1' x 100_000 ) . "\n\r\n" ) };
     cmp_ok( time - $t, '<', 5, 'unterminated chunk size line is rejected in linear time' );
+    like( $@, qr/Invalid chunk size line/, '... and refused' );
+}
+
+{
+    my $body = HTTP::Body->new( $ct, undef );
+    eval { $body->add( ( '1' x 100_000 ) . "\n\r\n" ) };
+    like( $@, qr/Chunk size line exceeds/, 'with the limit it is refused by its length alone' );
 }
