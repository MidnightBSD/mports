Adapt upstream Rails security fixes without changing the Rails series.
Upstream: https://github.com/rails/rails/commit/7fe85a72a789eae5ee070ce3ee1dad10a8a5f70c
Upstream: https://github.com/rails/rails/commit/ddc08ba61a8001e7402864c62e466cf732fc7614

--- lib/active_storage/service/gcs_service.rb.orig	2026-11-04 14:48:43 UTC
+++ lib/active_storage/service/gcs_service.rb
@@ -82,9 +82,9 @@
       end
     end

-    def url_for_direct_upload(key, expires_in:, checksum:, **)
+    def url_for_direct_upload(key, expires_in:, checksum:, content_length:, **)
       instrument :url, key: key do |payload|
-        generated_url = bucket.signed_url key, method: "PUT", expires: expires_in, content_md5: checksum
+        generated_url = bucket.signed_url key, method: "PUT", expires: expires_in, content_md5: checksum, headers: { "x-goog-content-length-range" => "#{content_length},#{content_length}" }

         payload[:url] = generated_url

@@ -92,10 +92,10 @@
       end
     end

-    def headers_for_direct_upload(key, checksum:, filename: nil, disposition: nil, **)
+    def headers_for_direct_upload(key, checksum:, content_length:, filename: nil, disposition: nil, **)
       content_disposition = content_disposition_with(type: disposition, filename: filename) if filename

-      { "Content-MD5" => checksum, "Content-Disposition" => content_disposition }
+      { "Content-MD5" => checksum, "x-goog-content-length-range" => "#{content_length},#{content_length}", "Content-Disposition" => content_disposition }
     end

     private
