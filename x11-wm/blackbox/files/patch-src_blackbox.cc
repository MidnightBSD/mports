--- src/blackbox.cc.orig	2018-05-28 06:57:18 UTC
+++ src/blackbox.cc
@@ -130,7 +130,7 @@ void Blackbox::shutdown(void) {
   XSetInputFocus(XDisplay(), PointerRoot, RevertToPointerRoot, XTime());
 
   std::for_each(screen_list, screen_list + screen_list_count,
-                std::mem_fun(&BScreen::shutdown));
+                std::mem_fn(&BScreen::shutdown));
 
   XSync(XDisplay(), false);
 
@@ -399,7 +399,7 @@ void Blackbox::timeout(bt::Timer *) {
   menuTimestamps.clear();
 
   std::for_each(screen_list, screen_list + screen_list_count,
-                std::mem_fun(&BScreen::reconfigure));
+                std::mem_fn(&BScreen::reconfigure));
 
   bt::Color::clearCache();
   bt::Font::clearCache();
@@ -658,5 +658,5 @@ void Blackbox::rereadMenu(void) {
   menuTimestamps.clear();
 
   std::for_each(screen_list, screen_list + screen_list_count,
-                std::mem_fun(&BScreen::rereadMenu));
+                std::mem_fn(&BScreen::rereadMenu));
 }
