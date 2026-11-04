Adapt upstream Rails security fixes without changing the Rails series.
Upstream: https://github.com/rails/rails/commit/ea8c40121ce53a3d0255cd4eb6d13bfe3bc01776

--- lib/active_storage/analyzer/image_analyzer.rb.orig	2026-11-04 14:48:43 UTC
+++ lib/active_storage/analyzer/image_analyzer.rb
@@ -1,4 +1,6 @@
 # frozen_string_literal: true
+
+require "active_storage/image_magick"

 module ActiveStorage
   # Extracts width and height in pixels from an image blob.
@@ -32,6 +34,7 @@

     private
       def read_image
+        ActiveStorage.require_securable_mini_magick!
         download_blob_to_tempfile do |file|
           require "mini_magick"
           yield MiniMagick::Image.new(file.path)
