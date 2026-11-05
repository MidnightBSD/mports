GHSA-2586-8ghr-69fj: upstream Rails security fix backported to Rails 7.0.10.
Source: https://github.com/rails/rails/commit/5bb5ec66ed8faaf590ffe1222d7a5eb6e9d050f5.patch

--- lib/action_dispatch/middleware/session/cache_store.rb.orig	2026-11-04 14:48:25 UTC
+++ lib/action_dispatch/middleware/session/cache_store.rb
@@ -13,6 +13,8 @@
     # * <tt>expire_after</tt>  - The length of time a session will be stored before automatically expiring.
     #   By default, the <tt>:expires_in</tt> option of the cache is used.
     class CacheStore < AbstractSecureStore
+      LOADED_SESSION_ID = "action_dispatch.session.cache_store.loaded_session_id" # :nodoc:
+
       def initialize(app, options = {})
         @cache = options[:cache] || Rails.cache
         options[:expire_after] ||= @cache.options[:expires_in]
@@ -20,17 +22,20 @@
       end

       # Get a session from the cache.
-      def find_session(env, sid)
-        unless sid && (session = get_session_with_fallback(sid))
+      def find_session(req, sid)
+        if sid && (session = get_session_with_fallback(sid))
+          req.set_header(LOADED_SESSION_ID, sid.private_id)
+        else
           sid, session = generate_sid, {}
         end
         [sid, session]
       end

       # Set a session in the cache.
-      def write_session(env, sid, session, options)
+      def write_session(req, sid, session, options)
         key = cache_key(sid.private_id)
         if session
+          return false if destroyed_since_loaded?(req, sid)
           @cache.write(key, session, expires_in: options[:expire_after])
         else
           @cache.delete(key)
@@ -54,6 +59,24 @@
         def get_session_with_fallback(sid)
           @cache.read(cache_key(sid.private_id)) || @cache.read(cache_key(sid.public_id))
         end
+
+        # Writing back a session that another request deleted, such as on logout,
+        # would restore it.
+        def destroyed_since_loaded?(req, sid)
+          req.get_header(LOADED_SESSION_ID) == sid.private_id &&
+            !exist_in_backend?(cache_key(sid.private_id)) &&
+            !exist_in_backend?(cache_key(sid.public_id))
+        end
+
+        # The request-local cache still holds the entry this request loaded, so
+        # a lookup through it cannot see a delete made by another request.
+        def exist_in_backend?(key)
+          if @cache.respond_to?(:with_local_cache)
+            @cache.with_local_cache { @cache.exist?(key) }
+          else
+            @cache.exist?(key)
+          end
+        end
     end
   end
 end
