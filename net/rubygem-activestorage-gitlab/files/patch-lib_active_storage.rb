Backport Rails 8.0 security fixes to GitLab Rails 7.2.3.
Upstream: https://github.com/rails/rails/commit/69aff80d115bbb9d1e82fd6c6f2fd3ddeafb958b

--- lib/active_storage.rb.orig	2025-10-28 23:24:00 UTC
+++ lib/active_storage.rb
@@ -362,5 +362,11 @@

   mattr_accessor :video_preview_arguments, default: "-y -vframes 1 -f image2"

+  mattr_accessor :ffmpeg_allowed_formats, default: %w[ mov matroska avi mpeg mpegts flv asf ogg mp3 wav flac aac aiff caf ].freeze
+
+  def self.ffmpeg_format_whitelist_arguments # :nodoc:
+    [ "-format_whitelist", Array(ffmpeg_allowed_formats).join(",") ] unless ffmpeg_allowed_formats.nil?
+  end
+
   module Transformers
     extend ActiveSupport::Autoload
