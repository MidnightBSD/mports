Backport Rails 8.0 security fixes to GitLab Rails 7.2.3.
Upstream: https://github.com/rails/rails/commit/c3772a10f405f9644125cbb484adfd2aa7a25a59

--- lib/action_view/helpers/sanitize_helper.rb.orig	2025-10-28 23:24:00 UTC
+++ lib/action_view/helpers/sanitize_helper.rb
@@ -1,5 +1,6 @@
 # frozen_string_literal: true

+require "active_support/core_ext/string/output_safety"
 require "rails-html-sanitizer"

 module ActionView
@@ -27,6 +28,9 @@
       # Please note that sanitizing user-provided text does not guarantee that the
       # resulting markup is valid or even well-formed.
       #
+      # The output is markup, which is safe only as element content. Do not use it in an attribute
+      # value; use +strip_tags+ or a tag helper such as <tt>tag.a(title: ...)</tt> instead.
+      #
       # ==== Options
       #
       # [+:tags+]
@@ -131,7 +135,8 @@
       #   strip_tags("> A quote from Smith & Wesson")
       #   # => &gt; A quote from Smith &amp; Wesson
       def strip_tags(html)
-        self.class.full_sanitizer.sanitize(html)&.html_safe
+        stripped = self.class.full_sanitizer.sanitize(html)
+        ERB::Util.html_escape_once(stripped) if stripped
       end

       # Strips all link tags from +html+ leaving just the link text.
