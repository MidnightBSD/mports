Adapt upstream Rails security fixes without changing the Rails series.
Upstream: https://github.com/rails/rails/commit/8106938fb0a595f11006dd1497cd409e27d7d636

--- app/models/active_storage/blob.rb.orig	2026-11-04 14:48:43 UTC
+++ app/models/active_storage/blob.rb
@@ -274,7 +274,7 @@
   # Raises ActiveStorage::IntegrityError if the downloaded data does not match the blob's checksum.
   def open(tmpdir: nil, &block)
     service.open key, checksum: checksum,
-      name: [ "ActiveStorage-#{id}-", filename.extension_with_delimiter ], tmpdir: tmpdir, &block
+      name: [ "ActiveStorage-#{id}-", tempfile_extension ], tmpdir: tmpdir, &block
   end

   def mirror_later #:nodoc:
@@ -310,6 +310,25 @@
   end

   private
+    # The extension is there for tools that cannot tell the type from the bytes (316d87e4: ImageMagick
+    # needs it for an SVG with no XML declaration), but some tools choose a decoder on it alone: FFmpeg
+    # runs a `.avs` file as an AviSynth script. So the uploaded extension is kept only when it denotes
+    # the blob's media type.
+    def tempfile_extension
+      extension = filename.extension_with_delimiter
+      return "" if extension.blank?
+
+      type_for_extension = Marcel::MimeType.for(name: filename.to_s)
+      return "" if type_for_extension == Marcel::MimeType::BINARY || type_for_extension != media_type
+
+      extension
+    end
+
+    # Marcel answers in canonical lowercase, so drop parameters and case before comparing.
+    def media_type
+      content_type.to_s.split(";").first.to_s.strip.downcase
+    end
+
     def compute_checksum_in_chunks(io)
       Digest::MD5.new.tap do |checksum|
         while chunk = io.read(5.megabytes)
