GHSA-wm3x-v3qw-4jh3: upstream Rails security fix backported to Rails 7.2.3.2.
Source: https://github.com/rails/rails/commit/2fc8838300133931e19eed3ea6cee76a7e83f19c.patch

--- lib/action_controller/metal/strong_parameters.rb.orig	2026-11-04 14:48:25 UTC
+++ lib/action_controller/metal/strong_parameters.rb
@@ -184,15 +184,14 @@
     #     as_json(options=nil)
     #
     # Returns a hash that can be used as the JSON representation for the parameters.
-
-    ##
-    # :method: each_key
-    #
-    # :call-seq:
-    #     each_key(&block)
-    #
-    # Calls block once for each key in the parameters, passing the key. If no block
-    # is given, an enumerator is returned instead.
+    #
+    # Like `#to_unsafe_h`, the hash holds every parameter, permitted or not, and
+    # mass assignment does not check it. Do not pass it to a model.
+    #
+    #     params = ActionController::Parameters.new(name: "Bob", admin: true)
+    #     params.as_json           # => {"name" => "Bob", "admin" => true}
+    #     User.new(params)         # => ActiveModel::ForbiddenAttributesError
+    #     User.new(params.as_json) # => #<User name: "Bob", admin: true>

     ##
     # :method: empty?
@@ -235,7 +234,7 @@
     # Returns the content of the parameters as a string.

     delegate :keys, :empty?, :exclude?, :include?,
-      :as_json, :to_s, :each_key, to: :@parameters
+      :as_json, :to_s, to: :@parameters

     alias_method :has_key?, :include?
     alias_method :key?, :include?
@@ -417,6 +416,15 @@
       @parameters.each_pair do |key, value|
         yield convert_hashes_to_parameters(key, value)
       end
+
+      self
+    end
+
+    # Calls block once for each key in the parameters, passing the key. If no block
+    # is given, an enumerator is returned instead.
+    def each_key(&block)
+      return to_enum(:each_key) unless block_given?
+      @parameters.each_key(&block)

       self
     end
