Adapt upstream Rails security fixes without changing the Rails series.
Upstream: https://github.com/rails/rails/commit/69aff80d115bbb9d1e82fd6c6f2fd3ddeafb958b
Upstream: https://github.com/rails/rails/commit/ea8c40121ce53a3d0255cd4eb6d13bfe3bc01776

--- lib/active_storage/engine.rb.orig	2026-11-04 14:48:43 UTC
+++ lib/active_storage/engine.rb
@@ -17,6 +17,7 @@
     config.active_storage = ActiveSupport::OrderedOptions.new
     config.active_storage.previewers = [ ActiveStorage::Previewer::PopplerPDFPreviewer, ActiveStorage::Previewer::MuPDFPreviewer, ActiveStorage::Previewer::VideoPreviewer ]
     config.active_storage.analyzers = [ ActiveStorage::Analyzer::ImageAnalyzer, ActiveStorage::Analyzer::VideoAnalyzer ]
+    config.active_storage.ffmpeg_allowed_formats = ActiveStorage.ffmpeg_allowed_formats
     config.active_storage.paths = ActiveSupport::OrderedOptions.new

     config.active_storage.variable_content_types = %w(
@@ -55,6 +56,8 @@

     initializer "active_storage.configs" do
       config.after_initialize do |app|
+        ActiveStorage.ffmpeg_allowed_formats = app.config.active_storage.ffmpeg_allowed_formats
+        ActiveStorage::ImageMagick.apply_policy if ActiveStorage::MINIMAGICK_AVAILABLE && !ActiveStorage::MINIMAGICK_UNSECURABLE
         ActiveStorage.logger     = app.config.active_storage.logger || Rails.logger
         ActiveStorage.queue      = app.config.active_storage.queue
         ActiveStorage.previewers = app.config.active_storage.previewers || []
