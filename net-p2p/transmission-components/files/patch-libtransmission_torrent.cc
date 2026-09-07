-- fmt 12 removed fmt::localtime. localtime_r is what it wrapped, so use it
-- directly; fmt formats a std::tm the same way.
--- libtransmission/torrent.cc.orig	2024-03-12 00:00:00 UTC
+++ libtransmission/torrent.cc
@@ -447,7 +447,10 @@
     auto const labels_str = buildLabelsString(tor);
     auto const trackers_str = buildTrackersString(tor);
     auto const bytes_downloaded_str = std::to_string(tor->downloadedCur + tor->downloadedPrev);
-    auto const localtime_str = fmt::format("{:%a %b %d %T %Y%n}", fmt::localtime(tr_time()));
+    auto const now_time = tr_time();
+    auto now_tm = std::tm{};
+    ::localtime_r(&now_time, &now_tm);
+    auto const localtime_str = fmt::format("{:%a %b %d %T %Y%n}", now_tm);
 
     auto const env = std::map<std::string_view, std::string_view>{
         { "TR_APP_VERSION"sv, SHORT_VERSION_STRING },
