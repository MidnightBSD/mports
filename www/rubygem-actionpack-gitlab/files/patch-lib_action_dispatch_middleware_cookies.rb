GHSA-x6mj-8jx9-qhqv: upstream Rails security fix backported to Rails 7.2.3.
Source: https://github.com/rails/rails/commit/0e6cf8faa89caf4c64311d35ca2bc88c1458d4e3.patch

index dbf07d52545f..e506f7efe7ce 100644
--- lib/action_dispatch/middleware/cookies.rb	2025-10-28 23:24:00 UTC
+++ lib/action_dispatch/middleware/cookies.rb
@@ -324,6 +324,7 @@ def self.build(req, cookies)
       def initialize(request)
         @set_cookies = {}
         @delete_cookies = {}
+        @upgraded_cookies = Set.new
         @request = request
         @cookies = {}
         @committed = false
@@ -386,6 +387,7 @@ def []=(name, options)
         end

         handle_options(options)
+        @upgraded_cookies.delete(name.to_s)

         if @cookies[name.to_s] != value || options[:expires]
           @cookies[name.to_s] = value
@@ -426,8 +428,14 @@ def clear(options = {})
         @cookies.each_key { |k| delete(k, options) }
       end

+      def upgraded(name)
+        @upgraded_cookies << name.to_s
+      end
+
       def write(response)
         @set_cookies.each do |name, value|
+          next if @upgraded_cookies.include?(name) && request.session_options[:skip]
+
           if write_cookie?(value)
             response.set_cookie(name, value)
           end
@@ -533,6 +541,10 @@ def []=(name, options)
         @parent_jar[name] = options
       end

+      def upgraded(name)
+        @parent_jar.upgraded(name)
+      end
+
       protected
         def request; @parent_jar.request; end

@@ -599,7 +611,10 @@ def parse(name, dumped, force_reserialize: false, **)
               return
             end

-            self[name] = { value: value } if force_reserialize || reserialize?(dumped)
+            if force_reserialize || reserialize?(dumped)
+              self[name] = { value: value }
+              upgraded(name)
+            end

             value
           end
