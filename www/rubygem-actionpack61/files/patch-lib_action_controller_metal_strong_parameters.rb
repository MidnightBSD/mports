GHSA-wm3x-v3qw-4jh3: upstream Rails security fix backported to Rails 6.1.7.10.
Source: https://github.com/rails/rails/commit/2fc8838300133931e19eed3ea6cee76a7e83f19c.patch

--- lib/action_controller/metal/strong_parameters.rb.orig	2026-11-04 14:48:25 UTC
+++ lib/action_controller/metal/strong_parameters.rb
@@ -244,7 +244,7 @@
     #
     # Returns a new array of the values of the parameters.
     delegate :keys, :key?, :has_key?, :member?, :values, :has_value?, :value?, :empty?, :include?,
-      :as_json, :to_s, :each_key, to: :@parameters
+      :as_json, :to_s, to: :@parameters

     # By default, never raise an UnpermittedParameters exception if these
     # params are present. The default includes both 'controller' and 'action'
@@ -401,5 +401,12 @@
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
