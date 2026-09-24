--- src/Screen.cc.orig	2020-02-11 12:27:30 UTC
+++ src/Screen.cc
@@ -2081,12 +2081,12 @@ void BScreen::toggleFocusModel(FocusModel model) {
 
 void BScreen::toggleFocusModel(FocusModel model) {
   std::for_each(windowList.begin(), windowList.end(),
-                std::mem_fun(&BlackboxWindow::ungrabButtons));
+                std::mem_fn(&BlackboxWindow::ungrabButtons));
 
   _blackbox->resource().setFocusModel(model);
 
   std::for_each(windowList.begin(), windowList.end(),
-                std::mem_fun(&BlackboxWindow::grabButtons));
+                std::mem_fn(&BlackboxWindow::grabButtons));
 }
 
 
@@ -2130,7 +2130,7 @@ void BScreen::updateClientListHint(void) const {
   bt::EWMH::WindowList clientList(windowList.size());
 
   std::transform(windowList.begin(), windowList.end(), clientList.begin(),
-                 std::mem_fun(&BlackboxWindow::clientWindow));
+                 std::mem_fn(&BlackboxWindow::clientWindow));
 
   _blackbox->ewmh().setClientList(screen_info.rootWindow(), clientList);
 }
