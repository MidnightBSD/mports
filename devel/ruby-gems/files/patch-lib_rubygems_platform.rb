--- lib/rubygems/platform.rb.orig	2022-09-29 21:45:53 UTC
+++ lib/rubygems/platform.rb
@@ -96,6 +96,7 @@ class Gem::Platform
       when /darwin(\d+)?/ then          [ "darwin",    $1  ]
       when /^macruby$/ then             [ "macruby",   nil ]
       when /freebsd(\d+)?/ then         [ "freebsd",   $1  ]
+      when /midnightbsd(\d+)?/ then     [ "midnightbsd",   $1  ]
       when /hpux(\d+)?/ then            [ "hpux",      $1  ]
       when /^java$/, /^jruby$/ then     [ "java",      nil ]
       when /^java([\d.]*)/ then         [ "java",      $1  ]
