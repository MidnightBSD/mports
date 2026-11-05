Include the shipped ImageMagick policy and loader in the rebuilt gem.
Upstream: https://github.com/rails/rails/commit/ea8c40121ce53a3d0255cd4eb6d13bfe3bc01776

--- activestorage.gemspec.orig	1980-01-02 00:00:00 UTC
+++ activestorage.gemspec
@@ -16,1 +16,2 @@
   s.homepage = "https://rubyonrails.org".freeze
+  s.files += ["lib/active_storage/image_magick/policy.xml", "lib/active_storage/image_magick.rb"]
