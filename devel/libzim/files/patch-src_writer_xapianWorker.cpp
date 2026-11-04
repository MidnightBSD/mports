--- src/writer/xapianWorker.cpp.orig
+++ src/writer/xapianWorker.cpp
@@ -66 +66 @@
-      document.add_value(1, Formatter() << mp_indexData->getWordCount());
+      document.add_value(1, static_cast<std::string>(Formatter() << mp_indexData->getWordCount()));
