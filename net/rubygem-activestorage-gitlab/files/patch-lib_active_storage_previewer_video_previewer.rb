Backport Rails 8.0 security fixes to GitLab Rails 7.2.3.
Upstream: https://github.com/rails/rails/commit/69aff80d115bbb9d1e82fd6c6f2fd3ddeafb958b

--- lib/active_storage/previewer/video_previewer.rb.orig	2025-10-28 23:24:00 UTC
+++ lib/active_storage/previewer/video_previewer.rb
@@ -30,7 +30,7 @@

     private
       def draw_relevant_frame_from(file, &block)
-        draw self.class.ffmpeg_path, "-i", file.path, *Shellwords.split(ActiveStorage.video_preview_arguments), "-", &block
+        draw self.class.ffmpeg_path, *ActiveStorage.ffmpeg_format_whitelist_arguments, "-i", file.path, *Shellwords.split(ActiveStorage.video_preview_arguments), "-", &block
       end
   end
 end
