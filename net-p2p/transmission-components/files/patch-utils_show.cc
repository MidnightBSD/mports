-- fmt 12 removed fmt::localtime; use localtime_r, which is what it wrapped.
-- The ternary is expanded because both arms must now yield std::string for
-- the deduced return type.
--- utils/show.cc.orig	2024-03-12 00:00:00 UTC
+++ utils/show.cc
@@ -160,7 +160,14 @@
 
 [[nodiscard]] auto toString(time_t now)
 {
-    return now == 0 ? "Unknown" : fmt::format("{:%a %b %d %T %Y}", fmt::localtime(now));
+    if (now == 0)
+    {
+        return std::string{ "Unknown" };
+    }
+
+    auto now_tm = std::tm{};
+    ::localtime_r(&now, &now_tm);
+    return fmt::format("{:%a %b %d %T %Y}", now_tm);
 }
 
 bool compareSecondField(std::string_view l, std::string_view r)
