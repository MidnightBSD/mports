Include the security policy and loader in the rebuilt gem.
Upstream: https://github.com/rails/rails/commit/ea8c40121ce53a3d0255cd4eb6d13bfe3bc01776

--- activestorage.gemspec.orig	2026-11-04 14:29:26 UTC
+++ activestorage.gemspec
@@ -16,1 +16,2 @@
   s.homepage = "https://rubyonrails.org".freeze
+  s.files += ["lib/active_storage/image_magick.rb", "lib/active_storage/image_magick/policy.xml"]
