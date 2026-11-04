Adapt upstream Rails security fixes without changing the Rails series.
Upstream: https://github.com/rails/rails/commit/69aff80d115bbb9d1e82fd6c6f2fd3ddeafb958b

--- lib/active_storage/previewer/video_previewer.rb.orig	2026-11-04 14:48:43 UTC
+++ lib/active_storage/previewer/video_previewer.rb
@@ -16,6 +16,6 @@

     private
       def draw_relevant_frame_from(file, &block)
-        draw ffmpeg_path, "-i", file.path, "-y", "-vcodec", "png",
+        draw ffmpeg_path, *ActiveStorage.ffmpeg_format_whitelist_arguments, "-i", file.path, "-y", "-vcodec", "png",
           "-vf", "thumbnail", "-vframes", "1", "-f", "image2", "-", &block
       end
