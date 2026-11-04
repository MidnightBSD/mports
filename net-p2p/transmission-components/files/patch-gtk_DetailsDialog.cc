-- fmt 12 removed fmt::localtime; use localtime_r, which is what it wrapped.
-- fmt::join also moved to <fmt/ranges.h>, which was not included here.
--- gtk/DetailsDialog.cc.orig	2024-03-12 00:00:00 UTC
+++ gtk/DetailsDialog.cc
@@ -50,11 +50,13 @@
 #include <fmt/chrono.h>
 #include <fmt/core.h>
 #include <fmt/format.h>
+#include <fmt/ranges.h> // fmt::join
 
 #include <algorithm>
 #include <array>
 #include <cstddef>
 #include <cstdlib> // abort()
+#include <ctime>
 #include <limits>
 #include <memory>
 #include <numeric>
@@ -606,12 +608,26 @@
 
 [[nodiscard]] std::string get_date_string(time_t t)
 {
-    return t == 0 ? _("N/A") : fmt::format(FMT_STRING("{:%x}"), fmt::localtime(t));
+    if (t == 0)
+    {
+        return _("N/A");
+    }
+
+    auto tm = std::tm{};
+    ::localtime_r(&t, &tm);
+    return fmt::format(FMT_STRING("{:%x}"), tm);
 }
 
 [[nodiscard]] std::string get_date_time_string(time_t t)
 {
-    return t == 0 ? _("N/A") : fmt::format(FMT_STRING("{:%c}"), fmt::localtime(t));
+    if (t == 0)
+    {
+        return _("N/A");
+    }
+
+    auto tm = std::tm{};
+    ::localtime_r(&t, &tm);
+    return fmt::format(FMT_STRING("{:%c}"), tm);
 }
 
 } // namespace
