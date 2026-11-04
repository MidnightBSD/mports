--- lib/rubygems/platform.rb.orig	2025-09-09 04:54:45 UTC
+++ lib/rubygems/platform.rb
@@ -108,6 +108,7 @@ class Gem::Platform
                       when "macruby" then                    ["macruby", nil]
                       when /^macruby-?(\d+(?:\.\d+)*)?/ then ["macruby", $1]
                       when /freebsd-?(\d+)?/ then            ["freebsd", $1]
+                      when /midnightbsd-?(\d+)?/ then            ["midnightbsd", $1]
                       when "java", "jruby" then              ["java",    nil]
                       when /^java-?(\d+(?:\.\d+)*)?/ then    ["java",    $1]
                       when /^dalvik-?(\d+)?$/ then           ["dalvik",  $1]
