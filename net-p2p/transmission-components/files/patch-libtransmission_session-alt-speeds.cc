-- fmt 12 removed fmt::localtime. localtime_r is what it wrapped, so use it
-- directly.
--- libtransmission/session-alt-speeds.cc.orig	2024-03-12 00:00:00 UTC
+++ libtransmission/session-alt-speeds.cc
@@ -5,6 +5,8 @@
 
 #include <fmt/chrono.h>
 
+#include <ctime>
+
 #include "transmission.h"
 
 #include "log.h"
@@ -105,7 +107,8 @@
 
 [[nodiscard]] bool tr_session_alt_speeds::isActiveMinute(time_t time) const noexcept
 {
-    auto const tm = fmt::localtime(time);
+    auto tm = std::tm{};
+    ::localtime_r(&time, &tm);
 
     size_t minute_of_the_week = tm.tm_wday * MinutesPerDay + tm.tm_hour * MinutesPerHour + tm.tm_min;
 
