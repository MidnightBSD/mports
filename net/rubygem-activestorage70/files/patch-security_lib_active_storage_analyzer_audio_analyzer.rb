Adapt upstream Rails security fixes without changing the Rails series.
Upstream: https://github.com/rails/rails/commit/69aff80d115bbb9d1e82fd6c6f2fd3ddeafb958b

--- lib/active_storage/analyzer/audio_analyzer.rb.orig	2026-11-04 14:48:43 UTC
+++ lib/active_storage/analyzer/audio_analyzer.rb
@@ -48,9 +48,12 @@
             "-show_streams",
             "-show_format",
             "-v", "error",
+            *ActiveStorage.ffmpeg_format_whitelist_arguments,
             file.path
           ]) do |output|
             JSON.parse(output.read)
+          end.tap do
+            logger.warn "Audio analysis failed because ffprobe exited with status #{$?.exitstatus}. The file may be corrupt, or in a format outside config.active_storage.ffmpeg_allowed_formats." unless $?.success?
           end
         end
       rescue Errno::ENOENT
