--- lib/rubygems/platform.rb.orig	2024-11-05 06:14:56.000000000 -0500
+++ lib/rubygems/platform.rb	2024-12-07 12:50:45.538702000 -0500
@@ -118,6 +118,7 @@
                       when /darwin(\d+)?/ then          ["darwin",    $1]
                       when /^macruby$/ then             ["macruby",   nil]
                       when /freebsd(\d+)?/ then         ["freebsd",   $1]
+                      when /midnightbsd(\d+)?/ then      ["midnightbsd",   $1]
                       when /^java$/, /^jruby$/ then     ["java",      nil]
                       when /^java([\d.]*)/ then         ["java",      $1]
                       when /^dalvik(\d+)?$/ then        ["dalvik",    $1]
