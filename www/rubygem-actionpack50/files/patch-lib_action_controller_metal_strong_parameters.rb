GHSA-wm3x-v3qw-4jh3: upstream each_key fix adapted to Rails 5.0 method_missing.
Source: https://github.com/rails/rails/commit/2fc8838300133931e19eed3ea6cee76a7e83f19c.patch

--- lib/action_controller/metal/strong_parameters.rb.orig	2026-11-04 14:48:25 UTC
+++ lib/action_controller/metal/strong_parameters.rb
@@ -356,5 +356,12 @@
       @parameters.each_pair do |key, value|
         yield key, convert_hashes_to_parameters(key, value)
       end
+    end
+
+    # Yield keys without exposing the unfiltered hash through method_missing.
+    def each_key(&block)
+      return to_enum(:each_key) unless block_given?
+      @parameters.each_key(&block)
+      self
     end
     alias_method :each, :each_pair
