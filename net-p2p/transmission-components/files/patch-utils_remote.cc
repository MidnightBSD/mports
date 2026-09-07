-- fmt 12 removed fmt::localtime; use localtime_r, which is what it wrapped.
--- utils/remote.cc.orig	2024-03-12 00:00:00 UTC
+++ utils/remote.cc
@@ -21,6 +21,8 @@
 #include <event2/buffer.h>
 
 #include <fmt/chrono.h>
+
+#include <ctime>
 #include <fmt/format.h>
 
 #include <libtransmission/transmission.h>
@@ -900,7 +902,9 @@
 
 static char* format_date(char* buf, size_t buflen, time_t now)
 {
-    *fmt::format_to_n(buf, buflen - 1, "{:%a %b %d %T %Y}", fmt::localtime(now)).out = '\0';
+    auto now_tm = std::tm{};
+    ::localtime_r(&now, &now_tm);
+    *fmt::format_to_n(buf, buflen - 1, "{:%a %b %d %T %Y}", now_tm).out = '\0';
     return buf;
 }
 
