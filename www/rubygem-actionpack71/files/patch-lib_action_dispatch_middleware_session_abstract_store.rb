GHSA-gmj8-hvj3-49mw: upstream Rails security fix backported to Rails 7.1.6.
Source: https://github.com/rails/rails/commit/f2392996be723708271a8d30bfcf0edc221e53ef.patch

--- lib/action_dispatch/middleware/session/abstract_store.rb.orig	2026-11-04 14:48:25 UTC
+++ lib/action_dispatch/middleware/session/abstract_store.rb
@@ -18,7 +18,12 @@
     end

     module Compatibility
+      DEFAULT_SAME_SITE = proc { |request| request.cookies_same_site_protection } # :nodoc:
+
       def initialize(app, options = {})
         options[:key] ||= "_session_id"
+        unless options.key?(:same_site) || self.class::DEFAULT_OPTIONS.key?(:same_site)
+          options = options.merge(same_site: DEFAULT_SAME_SITE)
+        end
         super
       end
