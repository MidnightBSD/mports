Adapt upstream Rails security fixes without changing the Rails series.
Upstream: https://github.com/rails/rails/commit/9b0d4bef2211a2c08cab2e0ea17fa1d0efd5d47a

--- app/models/active_storage/filename.rb.orig	2026-11-04 14:48:43 UTC
+++ app/models/active_storage/filename.rb
@@ -25,7 +25,7 @@
   #   ActiveStorage::Filename.new("racecar").base     # => "racecar"
   #   ActiveStorage::Filename.new(".gitignore").base  # => ".gitignore"
   def base
-    File.basename @filename, extension_with_delimiter
+    File.basename sanitized, extension_with_delimiter
   end

   # Returns the extension of the filename (i.e. the substring following the last dot, excluding a dot at the
@@ -35,7 +35,7 @@
   #   ActiveStorage::Filename.new("racecar").extension_with_delimiter     # => ""
   #   ActiveStorage::Filename.new(".gitignore").extension_with_delimiter  # => ""
   def extension_with_delimiter
-    File.extname @filename
+    File.extname sanitized
   end

   # Returns the extension of the filename (i.e. the substring following the last dot, excluding a dot at
@@ -57,7 +57,7 @@
   #
   # Characters considered unsafe for storage (e.g. \, $, and the RTL override character) are replaced with a dash.
   def sanitized
-    @filename.encode(Encoding::UTF_8, invalid: :replace, undef: :replace, replace: "�").strip.tr("\u{202E}%$|:;/\t\r\n\\", "-")
+    @filename.encode(Encoding::UTF_8, invalid: :replace, undef: :replace, replace: "�").strip.tr("\u{202E}\u{0000}%$|:;/\t\r\n\\", "-")
   end

   # Returns the sanitized version of the filename.
