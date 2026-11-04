GHSA-rq8q-p985-fjq7
Security backport preserving the existing Rails series.
Upstream: https://github.com/rails/rails/commit/c3772a10f405f9644125cbb484adfd2aa7a25a59

--- lib/action_view/helpers/sanitize_helper.rb.orig
+++ lib/action_view/helpers/sanitize_helper.rb
@@ -99,7 +99,8 @@
       #   strip_tags("<div id='top-bar'>Welcome to my website!</div>")
       #   # => Welcome to my website!
       def strip_tags(html)
-        self.class.full_sanitizer.sanitize(html, encode_special_chars: false)
+        stripped = self.class.full_sanitizer.sanitize(html)
+        ERB::Util.html_escape_once(stripped) if stripped
       end

       # Strips all link tags from +html+ leaving just the link text.
