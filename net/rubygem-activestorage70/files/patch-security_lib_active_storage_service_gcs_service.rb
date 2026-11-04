Adapt upstream Rails security fixes without changing the Rails series.
Upstream: https://github.com/rails/rails/commit/7fe85a72a789eae5ee070ce3ee1dad10a8a5f70c
Upstream: https://github.com/rails/rails/commit/ddc08ba61a8001e7402864c62e466cf732fc7614

--- lib/active_storage/service/gcs_service.rb.orig	2026-11-04 14:48:43 UTC
+++ lib/active_storage/service/gcs_service.rb
@@ -87,27 +87,16 @@
       end
     end

-    def url_for_direct_upload(key, expires_in:, checksum:, custom_metadata: {}, **)
+    def url_for_direct_upload(key, expires_in:, checksum:, content_length:, custom_metadata: {}, **)
       instrument :url, key: key do |payload|
-        headers = {}
-        version = :v2
-
-        if @config[:cache_control].present?
-          headers["Cache-Control"] = @config[:cache_control]
-          # v2 signing doesn't support non `x-goog-` headers. Only switch to v4 signing
-          # if necessary for back-compat; v4 limits the expiration of the URL to 7 days
-          # whereas v2 has no limit
-          version = :v4
-        end
-
-        headers.merge!(custom_metadata_headers(custom_metadata))
-
+        # V2 signatures bind the Content-Type (empty) and Content-MD5 headers. GCS leaves headers
+        # other than x-goog-* out of V2 signatures, so the client sends Cache-Control unsigned.
         args = {
           content_md5: checksum,
           expires: expires_in,
-          headers: headers,
+          headers: { "x-goog-content-length-range" => content_length_range(content_length), **custom_metadata_headers(custom_metadata) },
           method: "PUT",
-          version: version,
+          version: :v2,
         }

         if @config[:iam]
@@ -123,10 +112,10 @@
       end
     end

-    def headers_for_direct_upload(key, checksum:, filename: nil, disposition: nil, custom_metadata: {}, **)
+    def headers_for_direct_upload(key, checksum:, content_length:, filename: nil, disposition: nil, custom_metadata: {}, **)
       content_disposition = content_disposition_with(type: disposition, filename: filename) if filename

-      headers = { "Content-MD5" => checksum, "Content-Disposition" => content_disposition, **custom_metadata_headers(custom_metadata) }
+      headers = { "Content-MD5" => checksum, "Content-Disposition" => content_disposition, "x-goog-content-length-range" => content_length_range(content_length), **custom_metadata_headers(custom_metadata) }
       if @config[:cache_control].present?
         headers["Cache-Control"] = @config[:cache_control]
       end
@@ -237,5 +226,9 @@
       def custom_metadata_headers(metadata)
         metadata.transform_keys { |key| "x-goog-meta-#{key}" }
       end
+
+      def content_length_range(content_length)
+        "#{content_length},#{content_length}"
+      end
   end
 end
