--- ./common/config.cpp.orig	Wed Jun 22 01:32:29 2005
+++ ./common/config.cpp	Sat Aug 18 18:01:35 2007
@@ -1308,13 +1308,14 @@
 
   PosibErr<void> Config::commit_all(Vector<int> * phs, const char * codeset)
   {
+    Conv to_utf8;
+   if (codeset)
+      RET_ON_ERR(to_utf8.setup(*this, codeset, "utf-8", NormTo)); 
+      
     committed_ = true;
     others_ = first_;
     first_ = 0;
     insert_point_ = &first_;
-    Conv to_utf8;
-    if (codeset)
-      RET_ON_ERR(to_utf8.setup(*this, codeset, "utf-8", NormTo));
     while (others_) {
       *insert_point_ = others_;
       others_ = others_->next;
