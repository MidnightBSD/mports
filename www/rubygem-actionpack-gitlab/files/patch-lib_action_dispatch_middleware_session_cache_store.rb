GHSA-2586-8ghr-69fj: upstream Rails security fix backported to Rails 7.2.3.
Source: https://github.com/rails/rails/commit/5bb5ec66ed8faaf590ffe1222d7a5eb6e9d050f5.patch

index ecf94da9a5b1a..f29f5b99ee23e 100644
--- lib/action_dispatch/middleware/session/cache_store.rb	2025-10-28 23:24:00 UTC
+++ lib/action_dispatch/middleware/session/cache_store.rb
@@ -20,6 +20,8 @@ module Session
     #     is used.
     #
     class CacheStore < AbstractSecureStore
+      LOADED_SESSION_ID = "action_dispatch.session.cache_store.loaded_session_id" # :nodoc:
+
       def initialize(app, options = {})
         @cache = options[:cache] || Rails.cache
         options[:expire_after] ||= @cache.options[:expires_in]
@@ -27,17 +29,20 @@ def initialize(app, options = {})
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
@@ -61,6 +66,24 @@ def cache_key(id)
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
