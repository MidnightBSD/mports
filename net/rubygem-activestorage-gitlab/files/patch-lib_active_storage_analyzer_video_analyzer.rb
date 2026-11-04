Backport Rails 8.0 security fixes to GitLab Rails 7.2.3.
Upstream: https://github.com/rails/rails/commit/69aff80d115bbb9d1e82fd6c6f2fd3ddeafb958b

--- lib/active_storage/analyzer/video_analyzer.rb.orig	2025-10-28 23:24:00 UTC
+++ lib/active_storage/analyzer/video_analyzer.rb
@@ -140,9 +140,12 @@
             "-show_streams",
             "-show_format",
             "-v", "error",
+            *ActiveStorage.ffmpeg_format_whitelist_arguments,
             file.path
           ]) do |output|
             JSON.parse(output.read)
+          end.tap do
+            logger.warn "Video analysis failed because ffprobe exited with status #{$?.exitstatus}. The file may be corrupt, or in a format outside config.active_storage.ffmpeg_allowed_formats." unless $?.success?
           end
         end
       rescue Errno::ENOENT
