Adapt upstream Rails security fixes without changing the Rails series.
Upstream: https://github.com/rails/rails/commit/8106938fb0a595f11006dd1497cd409e27d7d636

--- app/models/active_storage/variant.rb.orig	2026-11-04 14:48:43 UTC
+++ app/models/active_storage/variant.rb
@@ -114,8 +114,10 @@
     end

     def download_image
+      require "active_storage/image_magick"
+      ActiveStorage.require_securable_mini_magick!
       require "mini_magick"
-      MiniMagick::Image.create(blob.filename.extension_with_delimiter) { |file| download_blob_to(file) }
+      MiniMagick::Image.create(tempfile_extension) { |file| download_blob_to(file) }
     end

     def transform(image)
