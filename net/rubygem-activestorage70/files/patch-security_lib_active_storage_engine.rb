Adapt upstream Rails security fixes without changing the Rails series.
Upstream: https://github.com/rails/rails/commit/69aff80d115bbb9d1e82fd6c6f2fd3ddeafb958b
Upstream: https://github.com/rails/rails/commit/ea8c40121ce53a3d0255cd4eb6d13bfe3bc01776

--- lib/active_storage/engine.rb.orig	2026-11-04 14:48:43 UTC
+++ lib/active_storage/engine.rb
@@ -31,6 +31,7 @@
     config.active_storage.paths = ActiveSupport::OrderedOptions.new
     config.active_storage.queues = ActiveSupport::InheritableOptions.new
     config.active_storage.precompile_assets = true
+    config.active_storage.ffmpeg_allowed_formats = ActiveStorage.ffmpeg_allowed_formats

     config.active_storage.variable_content_types = %w(
       image/png
@@ -88,6 +89,13 @@
         ActiveStorage.variant_processor = app.config.active_storage.variant_processor || :mini_magick
         ActiveStorage.previewers        = app.config.active_storage.previewers || []
         ActiveStorage.analyzers         = app.config.active_storage.analyzers || []
+
+        if ActiveStorage::MINIMAGICK_AVAILABLE && !ActiveStorage::MINIMAGICK_UNSECURABLE
+          ActiveStorage::ImageMagick.apply_policy
+        end
+
+        ActiveStorage.require_securable_mini_magick! if ActiveStorage.variant_processor == :mini_magick
+
         ActiveStorage.paths             = app.config.active_storage.paths || {}
         ActiveStorage.routes_prefix     = app.config.active_storage.routes_prefix || "/rails/active_storage"
         ActiveStorage.draw_routes       = app.config.active_storage.draw_routes != false
@@ -116,5 +124,6 @@
         ActiveStorage.content_types_allowed_inline = app.config.active_storage.content_types_allowed_inline || []
         ActiveStorage.binary_content_type = app.config.active_storage.binary_content_type || "application/octet-stream"
         ActiveStorage.video_preview_arguments = app.config.active_storage.video_preview_arguments || "-y -vframes 1 -f image2"
+        ActiveStorage.ffmpeg_allowed_formats = app.config.active_storage.ffmpeg_allowed_formats

         ActiveStorage.silence_invalid_content_types_warning = app.config.active_storage.silence_invalid_content_types_warning || false
