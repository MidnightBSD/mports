Adapt upstream Rails security fixes without changing the Rails series.
Upstream: https://github.com/rails/rails/commit/69aff80d115bbb9d1e82fd6c6f2fd3ddeafb958b

--- lib/active_storage.rb.orig	2026-11-04 14:48:43 UTC
+++ lib/active_storage.rb
@@ -50,6 +50,12 @@
   mattr_accessor :previewers, default: []
   mattr_accessor :analyzers,  default: []

+  mattr_accessor :ffmpeg_allowed_formats, default: %w[ mov matroska avi mpeg mpegts flv asf ogg mp3 wav flac aac aiff caf ].freeze
+
+  def self.ffmpeg_format_whitelist_arguments # :nodoc:
+    [ "-format_whitelist", Array(ffmpeg_allowed_formats).join(",") ] unless ffmpeg_allowed_formats.nil?
+  end
+
   mattr_accessor :paths, default: {}

   mattr_accessor :variable_content_types,             default: []
