GHSA-x6mj-8jx9-qhqv: upstream Rails security fix backported to Rails 7.1.6.
Source: https://github.com/rails/rails/commit/0e6cf8faa89caf4c64311d35ca2bc88c1458d4e3.patch

--- lib/action_dispatch/middleware/cookies.rb.orig	2026-11-04 14:48:25 UTC
+++ lib/action_dispatch/middleware/cookies.rb
@@ -307,6 +307,7 @@
       def initialize(request)
         @set_cookies = {}
         @delete_cookies = {}
+        @upgraded_cookies = Set.new
         @request = request
         @cookies = {}
         @committed = false
@@ -369,6 +370,7 @@
         end

         handle_options(options)
+        @upgraded_cookies.delete(name.to_s)

         if @cookies[name.to_s] != value || options[:expires]
           @cookies[name.to_s] = value
@@ -409,8 +411,14 @@
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
@@ -516,6 +524,10 @@
         @parent_jar[name] = options
       end

+      def upgraded(name)
+        @parent_jar.upgraded(name)
+      end
+
       protected
         def request; @parent_jar.request; end

@@ -582,7 +594,10 @@
               return
             end

-            self[name] = { value: value } if force_reserialize || reserialize?(dumped)
+            if force_reserialize || reserialize?(dumped)
+              self[name] = { value: value }
+              upgraded(name)
+            end

             value
           end
