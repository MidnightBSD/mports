GHSA-wm3x-v3qw-4jh3: upstream Rails security fix backported to Rails 7.1.6.
Source: https://github.com/rails/rails/commit/2fc8838300133931e19eed3ea6cee76a7e83f19c.patch

--- lib/action_controller/metal/strong_parameters.rb.orig	2026-11-04 14:48:25 UTC
+++ lib/action_controller/metal/strong_parameters.rb
@@ -227,7 +227,7 @@
     # Returns the content of the parameters as a string.

     delegate :keys, :empty?, :exclude?, :include?,
-      :as_json, :to_s, :each_key, to: :@parameters
+      :as_json, :to_s, to: :@parameters

     alias_method :has_key?, :include?
     alias_method :key?, :include?
@@ -412,5 +412,12 @@
         yield convert_hashes_to_parameters(key, value)
       end

+      self
+    end
+
+    # Yield keys without returning the unfiltered backing hash.
+    def each_key(&block)
+      return to_enum(:each_key) unless block_given?
+      @parameters.each_key(&block)
       self
     end
