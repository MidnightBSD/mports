GHSA-gmj8-hvj3-49mw: upstream Rails security fix backported to Rails 7.2.3.
Source: https://github.com/rails/rails/commit/f2392996be723708271a8d30bfcf0edc221e53ef.patch

index 39614fadcac1b..42c17db81011a 100644
--- lib/action_dispatch/middleware/session/abstract_store.rb	2025-10-28 23:24:00 UTC
+++ lib/action_dispatch/middleware/session/abstract_store.rb
@@ -20,7 +20,12 @@ def initialize
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
