Adapt upstream Rails security fixes without changing the Rails series.
Upstream: https://github.com/rails/rails/commit/69aff80d115bbb9d1e82fd6c6f2fd3ddeafb958b

--- lib/active_storage/analyzer/video_analyzer.rb.orig	2026-11-04 14:48:43 UTC
+++ lib/active_storage/analyzer/video_analyzer.rb
@@ -105,7 +105,7 @@
       end

       def probe_from(file)
-        IO.popen([ ffprobe_path, "-print_format", "json", "-show_streams", "-v", "error", file.path ]) do |output|
+        IO.popen([ ffprobe_path, "-print_format", "json", "-show_streams", "-v", "error", *ActiveStorage.ffmpeg_format_whitelist_arguments, file.path ]) do |output|
           JSON.parse(output.read)
         end
       rescue Errno::ENOENT
