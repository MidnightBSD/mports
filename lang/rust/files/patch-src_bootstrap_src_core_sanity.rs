On MidnightBSD (and FreeBSD), the system compiler is named "cc" but is
in fact Clang.  The vendor/cc.rs patch forces Clang to be detected as
GNU to avoid libstdc++ being selected via an unversioned FreeBSD triple,
but that makes is_like_clang() return false here.  Allow "cc" through
since we know the base system cc is Clang on supported releases.

--- src/bootstrap/src/core/sanity.rs.orig	2025-09-18 00:00:00 UTC
+++ src/bootstrap/src/core/sanity.rs
@@ -336,7 +336,8 @@ pub fn check(build: &mut Build) {
         {
             let cc_tool = build.cc_tool(*target);
-            if !cc_tool.is_like_clang() && !cc_tool.path().ends_with("emcc") {
+            if !cc_tool.is_like_clang() && !cc_tool.path().ends_with("emcc")
+                && !cc_tool.path().ends_with("cc") {
                 // emcc works as well
                 panic!(
