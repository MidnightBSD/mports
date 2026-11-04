GHSA-68p9-83h6-5wpj
Security backport preserving the existing Rails series.
Upstream: https://github.com/rails/rails/commit/f47452533e1f28d847c63181b9d5f8b7243ef9a4

--- lib/action_view/helpers/tag_helper.rb.orig
+++ lib/action_view/helpers/tag_helper.rb
@@ -150,14 +150,20 @@
           return if options.blank?
           attrs = []
           options.each_pair do |key, value|
+            next if key.blank?
+            name = key.to_s
+            next if name.blank?
             if TAG_PREFIXES.include?(key) && value.is_a?(Hash)
               value.each_pair do |k, v|
-                attrs << prefix_tag_option(key, k, v, escape)
+                next if k.blank?
+                nested_name = k.to_s
+                next if nested_name.blank?
+                attrs << prefix_tag_option(name, nested_name, v, escape)
               end
             elsif BOOLEAN_ATTRIBUTES.include?(key)
-              attrs << boolean_tag_option(key) if value
+              attrs << boolean_tag_option(name) if value
             elsif !value.nil?
-              attrs << tag_option(key, value, escape)
+              attrs << tag_option(name, value, escape)
             end
           end
           " #{attrs * ' '}" unless attrs.empty?
