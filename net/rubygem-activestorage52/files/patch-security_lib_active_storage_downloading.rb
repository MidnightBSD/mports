Adapt upstream Rails security fixes without changing the Rails series.
Upstream: https://github.com/rails/rails/commit/8106938fb0a595f11006dd1497cd409e27d7d636

--- lib/active_storage/downloading.rb.orig	2026-11-04 14:48:43 UTC
+++ lib/active_storage/downloading.rb
@@ -13,8 +13,27 @@
         end
       end

+      # The extension is there for tools that cannot tell the type from the bytes (316d87e4: ImageMagick
+      # needs it for an SVG with no XML declaration), but some tools choose a decoder on it alone: FFmpeg
+      # runs a `.avs` file as an AviSynth script. So the uploaded extension is kept only when it denotes
+      # the blob's media type.
+      def tempfile_extension
+        extension = blob.filename.extension_with_delimiter
+        return "" if extension.blank?
+
+        type_for_extension = Marcel::MimeType.for(name: blob.filename.to_s)
+        return "" if type_for_extension == Marcel::MimeType::BINARY || type_for_extension != media_type
+
+        extension
+      end
+
+      # Marcel answers in canonical lowercase, so drop parameters and case before comparing.
+      def media_type
+        blob.content_type.to_s.split(";").first.to_s.strip.downcase
+      end
+
       def open_tempfile_for_blob
-        tempfile = Tempfile.open([ "ActiveStorage", blob.filename.extension_with_delimiter ], tempdir)
+        tempfile = Tempfile.open([ "ActiveStorage", tempfile_extension ], tempdir)

         begin
           yield tempfile
