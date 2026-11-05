GHSA-r9jg-fmfx-2gv6: upstream Rails security fix backported to Rails 7.2.3.2.
Source: https://github.com/rails/rails/commit/b58c107abe9c1f10c1d6a4941402c60e4dc4742c.patch

--- lib/action_controller/metal/rendering.rb.orig	2026-11-04 14:48:25 UTC
+++ lib/action_controller/metal/rendering.rb
@@ -218,7 +218,14 @@
       end

       def _set_vary_header
-        if response.headers["Vary"].blank? && request.should_apply_vary_header?
-          response.headers["Vary"] = "Accept"
+        if request.should_apply_vary_header?
+          vary_headers = response.headers["Vary"].to_s.split(",").map(&:strip).reject(&:blank?)
+
+          unless vary_headers.include?("*")
+            request.vary_headers.each do |header|
+              vary_headers << header unless vary_headers.any? { |existing| existing.casecmp?(header) }
+            end
+            response.headers["Vary"] = vary_headers.join(", ")
+          end
         end
       end
