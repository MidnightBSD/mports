Backport Rails 8.0 security fixes to GitLab Rails 7.2.3.
Upstream: https://github.com/rails/rails/commit/f47452533e1f28d847c63181b9d5f8b7243ef9a4

--- lib/action_view/helpers/tag_helper.rb.orig	2025-10-28 23:24:00 UTC
+++ lib/action_view/helpers/tag_helper.rb
@@ -263,16 +263,28 @@
           output = +""
           sep    = " "
           options.each_pair do |key, value|
+            next if key.blank?
+
+            name = Symbol === key ? key.name : key.to_s
+            next if name.blank?
+
             type = TAG_TYPES[key]
             if type == :data && value.is_a?(Hash)
               value.each_pair do |k, v|
-                next if v.nil?
+                next if k.blank? || v.nil?
+
+                nested_name = Symbol === k ? k.name : k.to_s
+                next if nested_name.blank?
+
                 output << sep
-                output << prefix_tag_option(key, k, v, escape)
+                output << prefix_tag_option(name, nested_name, v, escape)
               end
             elsif type == :aria && value.is_a?(Hash)
               value.each_pair do |k, v|
-                next if v.nil?
+                next if k.blank? || v.nil?
+
+                nested_name = Symbol === k ? k.name : k.to_s
+                next if nested_name.blank?

                 case v
                 when Array, Hash
@@ -285,16 +297,16 @@
                 end

                 output << sep
-                output << prefix_tag_option(key, k, v, escape)
+                output << prefix_tag_option(name, nested_name, v, escape)
               end
             elsif type == :boolean
               if value
                 output << sep
-                output << boolean_tag_option(key)
+                output << boolean_tag_option(name)
               end
             elsif !value.nil?
               output << sep
-              output << tag_option(key, value, escape)
+              output << tag_option(name, value, escape)
             end
           end
           output unless output.empty?
