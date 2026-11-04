Backport Rails 8.0 security fixes to GitLab Rails 7.2.3.
Upstream: https://github.com/rails/rails/commit/ea8c40121ce53a3d0255cd4eb6d13bfe3bc01776

--- lib/active_storage/analyzer/image_analyzer/image_magick.rb.orig	2025-10-28 23:24:00 UTC
+++ lib/active_storage/analyzer/image_analyzer/image_magick.rb
@@ -1,4 +1,6 @@
 # frozen_string_literal: true
+
+require "active_storage/image_magick"

 module ActiveStorage
   # This analyzer relies on the third-party {MiniMagick}[https://github.com/minimagick/minimagick] gem. MiniMagick requires
@@ -16,6 +18,8 @@
           logger.info "Skipping image analysis because the mini_magick gem isn't installed"
           return {}
         end
+
+        ActiveStorage.require_securable_mini_magick!

         download_blob_to_tempfile do |file|
           image = instrument("mini_magick") do
