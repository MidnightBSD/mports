--- lib/rubygems/platform.rb.orig	2023-07-14 07:10:23.000000000 -0400
+++ lib/rubygems/platform.rb	2023-08-30 13:36:58.131983000 -0400
@@ -97,6 +97,7 @@
       when /darwin(\d+)?/ then          [ "darwin",    $1  ]
       when /^macruby$/ then             [ "macruby",   nil ]
       when /freebsd(\d+)?/ then         [ "freebsd",   $1  ]
+      when /midnightbsd(\d+)?/ then     [ "midnightbsd", $1 ]
       when /^java$/, /^jruby$/ then     [ "java",      nil ]
       when /^java([\d.]*)/ then         [ "java",      $1  ]
       when /^dalvik(\d+)?$/ then        [ "dalvik",    $1  ]
