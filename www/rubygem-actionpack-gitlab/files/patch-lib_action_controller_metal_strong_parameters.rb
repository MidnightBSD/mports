GHSA-wm3x-v3qw-4jh3: upstream Rails security fix backported to Rails 7.2.3.
Source: https://github.com/rails/rails/commit/2fc8838300133931e19eed3ea6cee76a7e83f19c.patch

index e81f82a90d4ac..c375a5cd72bfa 100644
--- lib/action_controller/metal/strong_parameters.rb	2025-10-28 23:24:00 UTC
+++ lib/action_controller/metal/strong_parameters.rb
@@ -197,15 +197,14 @@ class Parameters
     #     as_json(options=nil)
     #
     # Returns a hash that can be used as the JSON representation for the parameters.
-
-    ##
-    # :method: each_key
     #
-    # :call-seq:
-    #     each_key(&block)
+    # Like `#to_unsafe_h`, the hash holds every parameter, permitted or not, and
+    # mass assignment does not check it. Do not pass it to a model.
     #
-    # Calls block once for each key in the parameters, passing the key. If no block
-    # is given, an enumerator is returned instead.
+    #     params = ActionController::Parameters.new(name: "Bob", admin: true)
+    #     params.as_json           # => {"name" => "Bob", "admin" => true}
+    #     User.new(params)         # => ActiveModel::ForbiddenAttributesError
+    #     User.new(params.as_json) # => #<User name: "Bob", admin: true>

     ##
     # :method: empty?
@@ -248,7 +247,7 @@ class Parameters
     # Returns the content of the parameters as a string.

     delegate :keys, :empty?, :exclude?, :include?,
-      :as_json, :to_s, :each_key, to: :@parameters
+      :as_json, :to_s, to: :@parameters

     alias_method :has_key?, :include?
     alias_method :key?, :include?
@@ -420,6 +419,15 @@ def each_value(&block)
       self
     end

+    # Calls block once for each key in the parameters, passing the key. If no block
+    # is given, an enumerator is returned instead.
+    def each_key(&block)
+      return to_enum(:each_key) unless block_given?
+      @parameters.each_key(&block)
+
+      self
+    end
+
     # Returns a new array of the values of the parameters.
     def values
       to_enum(:each_value).to_a
