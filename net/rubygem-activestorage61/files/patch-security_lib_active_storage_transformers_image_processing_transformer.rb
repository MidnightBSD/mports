Adapt upstream Rails security fixes without changing the Rails series.
Upstream: https://github.com/rails/rails/commit/ea8c40121ce53a3d0255cd4eb6d13bfe3bc01776

--- lib/active_storage/transformers/image_processing_transformer.rb.orig	2026-11-04 14:48:43 UTC
+++ lib/active_storage/transformers/image_processing_transformer.rb
@@ -26,5 +26,7 @@
         end

         def processor
+          require "active_storage/image_magick"
+          ActiveStorage.require_securable_mini_magick! if ActiveStorage.variant_processor == :mini_magick
           ImageProcessing.const_get(ActiveStorage.variant_processor.to_s.camelize)
         end
