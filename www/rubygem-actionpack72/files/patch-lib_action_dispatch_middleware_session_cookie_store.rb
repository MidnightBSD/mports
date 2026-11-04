GHSA-gmj8-hvj3-49mw: upstream Rails security fix backported to Rails 7.2.3.2.
Source: https://github.com/rails/rails/commit/f2392996be723708271a8d30bfcf0edc221e53ef.patch

--- lib/action_dispatch/middleware/session/cookie_store.rb.orig	2026-11-04 14:48:25 UTC
+++ lib/action_dispatch/middleware/session/cookie_store.rb
@@ -59,10 +59,7 @@
         end
       end

-      DEFAULT_SAME_SITE = proc { |request| request.cookies_same_site_protection } # :nodoc:
-
       def initialize(app, options = {})
         options[:cookie_only] = true
-        options[:same_site] = DEFAULT_SAME_SITE if !options.key?(:same_site)
         super
       end
