Adapt upstream Rails security fixes without changing the Rails series.
Upstream: https://github.com/rails/rails/commit/8106938fb0a595f11006dd1497cd409e27d7d636

--- app/models/active_storage/blob.rb.orig	2026-11-04 14:48:43 UTC
+++ app/models/active_storage/blob.rb
@@ -275,7 +275,8 @@

   # Downloads the blob to a tempfile on disk. Yields the tempfile.
   #
-  # The tempfile's name is prefixed with +ActiveStorage-+ and the blob's ID. Its extension matches that of the blob.
+  # The tempfile's name is prefixed with +ActiveStorage-+ and the blob's ID. It keeps the blob filename's
+  # extension when that extension denotes the blob's content type, and has no extension otherwise.
   #
   # By default, the tempfile is created in <tt>Dir.tmpdir</tt>. Pass +tmpdir:+ to create it in a different directory:
   #
@@ -291,7 +292,7 @@
       key,
       checksum: checksum,
       verify: !composed,
-      name: [ "ActiveStorage-#{id}-", filename.extension_with_delimiter ],
+      name: [ "ActiveStorage-#{id}-", tempfile_extension ],
       tmpdir: tmpdir,
       &block
     )
@@ -330,5 +331,24 @@
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
       raise ArgumentError, "io must be rewindable" unless io.respond_to?(:rewind)
