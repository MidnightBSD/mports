--- vendor/jruby/lib/ruby/stdlib/libfixposix/binary/version.rb.orig	2026-09-29 21:01:32 UTC
+++ vendor/jruby/lib/ruby/stdlib/libfixposix/binary/version.rb
@@ -13,7 +13,7 @@
 			"libfixposix.so"
 		end
 		PATH = if !File.exist?(File.join(__dir__, NAME))
-			File.join(__dir__, RbConfig.expand("$(target_cpu)-$(target_os)".dup), NAME)
+			File.join(__dir__, RbConfig.expand("$(target_cpu)-$(target_os)".dup).sub(/-midnightbsd\z/i, "-freebsd"), NAME)
 		else
 			File.join(__dir__, NAME)
 		end
