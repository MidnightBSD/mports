GHSA-rq8q-p985-fjq7
Security backport preserving the existing Rails series.
Upstream: https://github.com/rails/rails/commit/c3772a10f405f9644125cbb484adfd2aa7a25a59

--- lib/action_view/helpers/sanitize_helper.rb.orig
+++ lib/action_view/helpers/sanitize_helper.rb
@@ -112,7 +112,8 @@
       #   strip_tags("> A quote from Smith & Wesson")
       #   # => &gt; A quote from Smith &amp; Wesson
       def strip_tags(html)
-        self.class.full_sanitizer.sanitize(html)&.html_safe
+        stripped = self.class.full_sanitizer.sanitize(html)
+        ERB::Util.html_escape_once(stripped) if stripped
       end

       # Strips all link tags from +html+ leaving just the link text.
