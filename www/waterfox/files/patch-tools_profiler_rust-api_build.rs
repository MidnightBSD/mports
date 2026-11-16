--- tools/profiler/rust-api/build.rs.orig
+++ tools/profiler/rust-api/build.rs
@@ -88,6 +88,9 @@
         // successfully. Otherwise, it fails to build because MarkerSchema has
         // some std::strings as its fields.
         .opaque_type("std::string")
+        // libc++ 21 basic_string::__self_view is emitted by bindgen 0.69 with an
+        // unbound _CharT parameter (bug 1979820).
+        .blocklist_type(".*basic_string___self_view.*")
         // std::vector needs to be converted to an opaque type because, if it's
         // not an opaque type, bindgen can't find its size properly and
         // MarkerSchema's total size reduces. That causes a heap buffer overflow.
