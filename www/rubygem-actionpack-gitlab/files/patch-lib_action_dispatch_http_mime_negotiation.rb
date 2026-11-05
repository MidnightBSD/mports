GHSA-r9jg-fmfx-2gv6: upstream Rails security fix backported to Rails 7.2.3.
Source: https://github.com/rails/rails/commit/b58c107abe9c1f10c1d6a4941402c60e4dc4742c.patch

index ccc10def6596e..f63a2cb33a195 100644
--- lib/action_dispatch/http/mime_negotiation.rb	2025-10-28 23:24:00 UTC
+++ lib/action_dispatch/http/mime_negotiation.rb
@@ -158,7 +158,17 @@ def negotiate_mime(order)
       end

       def should_apply_vary_header?
-        !params_readable? && use_accept_header && valid_accept_header
+        !params_readable?
+      end
+
+      def vary_headers # :nodoc:
+        if use_accept_header
+          headers = ["Accept", "X-Requested-With"]
+          headers.insert(1, "Content-Type") if xhr? && accept.blank?
+          headers
+        else
+          ["X-Requested-With"]
+        end
       end

       private
