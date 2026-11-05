Adapt the upstream FFmpeg format restriction to Rails 6.1.
Upstream: https://github.com/rails/rails/commit/69aff80d115bbb9d1e82fd6c6f2fd3ddeafb958b

--- lib/active_storage/analyzer/video_analyzer.rb.orig	2026-11-04 14:48:43 UTC
+++ lib/active_storage/analyzer/video_analyzer.rb
@@ -113,6 +113,7 @@
           "-show_streams",
           "-show_format",
           "-v", "error",
+          *ActiveStorage.ffmpeg_format_whitelist_arguments,
           file.path
         ]) do |output|
           JSON.parse(output.read)
